#!/usr/bin/env bash

force=""
CACHE_DIR=$HOME/.aws/.cache/

while getopts "f" arg ; do
  case $arg in
    f)
      force="yes"
      ;;
  esac
done

shift $(expr $OPTIND - 1)

function cleanCacheIfRequired {
  local filename=$1
  [[ "x$force" != "x" && -f ${filename} ]] && echo "Deleting cache file '$filename'" && rm ${filename}
}

function stack {
  [[ -z "$1" ]] && echo "Usage: ec2 stack <stack_name>" && exit 1

  stackname="$1"
  account_id=$(aws configure get aws_access_key_id)
  filename=${CACHE_DIR}/${account_id}.json

  cleanCacheIfRequired ${filename}

  [[ ! -f ${filename} ]] && aws autoscaling describe-auto-scaling-groups > ${filename}

  # https://docs.aws.amazon.com/cli/latest/reference/ec2/describe-instances.html
  # https://stedolan.github.io/jq/manual/
  cat ${filename} | jq --arg v "$stackname" -rc '.AutoScalingGroups[] | {name : .AutoScalingGroupName} | select(.name | contains($v)) | .name' | while read i; do
    echo "Autoscaling group name is : '$i'"
    echo
    aws autoscaling describe-auto-scaling-groups --auto-scaling-group-name $i | jq -rc '.AutoScalingGroups[].Instances[].InstanceId' | while read instanceId; do
      aws ec2 describe-instances --instance-ids $instanceId | jq -r '.Reservations[] | .Instances[].NetworkInterfaces[].PrivateIpAddress' | while read ip; do
        echo "$instanceId: $ip"
      done
    done
  done
}

function bastion {
  filename=${CACHE_DIR}/bastion.json
  cleanCacheIfRequired ${filename}

  [[ ! -f ${filename} ]] && aws ec2 describe-instances --filters "Name=tag:Name,Values=Bastion" > ${filename}

  cat ${filename} | jq '.Reservations[].Instances[] | {id: .InstanceId, ip: .PublicIpAddress, private: .PrivateIpAddress, tags: [.Tags[].Value]}'
}

function instance {
  [[ -z "$1" ]] && echo "Usage: ec2 instance <instance_id>" && exit 1

  id=$1
  filename=${CACHE_DIR}/${id}.json
  cleanCacheIfRequired ${filename}

  [[ ! -f ${filename} ]] && aws ec2 describe-instances --instance-ids ${id} > ${filename}

  cat ${filename} | jq '.Reservations[]'
}



case "$1" in
  stack)
        shift
        stack "$@"
        ;;
  instance)
        shift
        instance "$@"
        ;;
  bastion)
        bastion
        ;;
  *)
        echo "Usage: $0 {bastion | stack | instance}"
        exit 1
esac

exit 0