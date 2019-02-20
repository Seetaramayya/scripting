#! /bin/bash


# Echo

    greetings="hello"

    # Needs to be escaped
    echo $greetings, world \(planet\)!

    # Nothing will be replaced or processed
    echo '$greetings, world (planet)!'

    # Replaced variables
    echo "$greetings, world (planet)!"


# Variables

    # variable name, =, value should not have any spaces
    variable_a="Good Morning"
    variable_b=16
    variable_c="$variable_a $variable_b"

    echo $variable_c

    # Variables can also be declared in the following way

    declare -i variable_d=123  # d is an integer
    declare -r variable_e=456  # e is read-only


    #declare -l f="Seeta"  # makes lower case, f is seeta
    #declare -u g="seeta"  # makes upper case, f is SEETA

# Built-in variables

    # Built in variables are documented here http://www.tldp.org/LDP/abs/html/internalvariables.html

    echo $HOME
    echo $PWD
    echo $MACHTYPE
    echo $BASH_VERSION
    echo $SECONDS

# Command substitution

    ping_time_to_example_com=$(ping -c 1 example.com | grep "bytes from" | cut -d = -f 4)
    echo "Time take to ping is '$ping_time_to_example_com'"

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
