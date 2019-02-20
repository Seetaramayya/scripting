#! /bin/bash

# Date
    echo "**********************************************"
    echo "                Date & Printf                 "
    echo "**********************************************"
    echo $(date)
    today=$(date +"%d-%m-%Y")
    time=$(date +"%H:%M:%S")

    # https://wiki.bash-hackers.org/commands/builtin/printf
    printf -v formatted_output "Current User:\t%s\nDate:\t\t%s\nTime:\t\t%s" $HOME $today $time

    echo "$formatted_output" # to preserve new lines double quotes are required

# Arrays

    echo "**********************************************"
    echo "                    Arrays                    "
    echo "**********************************************"
    # like remaining languages arrays are '0' based
    #
    fruits_array=("apple" "banana" "cherry")

    echo ${fruits_array[0]}

    fruits_array[5]="kiwi" # No need to populate every element in array

    echo ${fruits_array[@]} # prints all elements
    echo array size ${#fruits_array[@]} # size of the array

    # appends element to array
    # NOTE: Make sure parentheses around the value otherwise value will be append to first element
    fruits_array+=("mango")

    # Finds last element in the array
    echo ${fruits_array[@]: -1}  # (apple banana cherry kiwi mango) => mango
    echo ${fruits_array[@]: 2:1} # (apple banana cherry kiwi mango) => cherry kiwi mango => cherry
    echo ${fruits_array[@]: -2:1} # (apple banana cherry kiwi mango) => kiwi mango => kiwi


    # Associative arrays only works bash 4 and above
#    declare -A myarray
#    myarray["color"]="blue"
#    echo ${myarray["color"]}