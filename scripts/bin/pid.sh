#!/usr/bin/env bash
if [ -z "$1" ]; then
  echo "Usage: pid <port_number>"
  exit 1
fi

PORT=$1

lsof -nP -i4TCP:$PORT | grep LISTEN
