#! /bin/bash

# Arithmetic Operation

    # Double parenthesis is required to evaluate arithmetic expression. To assign it to variable $ is required
    plus=$(( 5 + 4 ))
    echo 5 + 4 = $plus

    minus=$(( $plus - 2 ))
    echo $plus - 2 = $minus

    times=$(( $plus * $minus ))
    echo "$plus * $minus = $times" # either escape '*' or double quotation

    division=$(( $plus / $minus ))
    echo "$plus / $minus = $division"

    modulo=$(( $plus % $minus ))
    echo "$plus % $minus = $modulo"

    exponentiation=$(( $modulo ** $minus ))
    echo "$modulo ** $minus = $exponentiation"

    # Increment and Decrement operators
    a=2
    ((a++))
    echo "a++ = $a"

    ((a --))
    echo "a-- = $a"

    ((a+=5)) #if you forget parenthesis it will be string CONCATENATION
    echo "a+5 = $a"

    ((a-=5))
    echo "a-5 = $a"

    ((a*=5))
    echo "a*5 = $a"

    ((a/=5))
    echo "a/5 = $a"

    a+=5
    echo "a+5 WITHOUT parenthesis is STRING CONCATENATION = $a"


# Comparison Operations

    # Double square brackets are required to evaluate comparision expression. To assign it to variable $ is required
    # spaces between brackets and expressions are important

    # For string comparision

    [[ "cat" == "dog" ]] # returns 1
    echo $?

    [[ "cat" == "cat" ]] # returns 0
    echo $?

    [[ 20 > 100 ]] # returns 0 if you expect 1 here is explanation: lexically 2,0 higher value than 1,0,0
    echo $?

    [[ 20 -gt 100 ]] # -lt, -gt, -le, -ge, -eq, -ne
    echo $?

    [[ 20 -lt 100 ]]
    echo $?

    [[ 20 -eq 100 ]]
    echo $?

    [[ 20 -ne 100 ]]
    echo $?

    [[ 20 -le 100 ]]
    echo $?

    [[ 20 -ge 100 ]]
    echo $?

# Logical Operations

    # Logical and is     [[ $a && $b ]]
    # Logical or is      [[ $a || $b ]]
    # Logical not is     [[ ! $a ]]
    # String is null     [[ -z $a ]]
    # String is NOT null [[ -n $a ]]
    hello="Hello"
    empty=""

    [[ -z $empty && -n $hello ]]
    echo "this should be 0 => $?"

# Working with strings

    # concatenation
    greeting=$hello" World"
    echo $greeting

    # length of string
    echo hello length is ${#hello}
    echo greeting length is ${#greeting}

    # Substring
    echo ${greeting:3:4}
    echo ${greeting: -5:4}

    fruits="apple banana banana cherry"
    echo ${fruits/banana/grape}  # first occurrence is replaced

    echo ${fruits//banana/grape} # it replaces all occurrences
    echo ${fruits/#apple/grape}  # if apple is first word then it will replace otherwise nothing

    echo ${fruits/#banana/grape} # if banana is first word then it will replace otherwise nothing
    echo ${fruits/#banana/grape} # if banana is first word then it will replace otherwise nothing

    echo ${fruits/%cherry/grape} # if banana is first word then it will replace otherwise nothing
    echo ${fruits/#banana/grape} # if banana is first word then it will replace otherwise nothing

    echo ${fruits/c*/grape}




