#! /bin/bash

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

# Coloring and styling text

    # 31 is foreground color and 40 is background color: http://www.tldp.org/LDP/abs/html/colorizing.html#AEN20327
    # 5 is style : blinking check styles here :

    flashred="\033[5;31;40m"
    red="\033[31;40m"
    none="\033[0m"
    echo -e "$flashred ERROR: $none $red Something went wrong$none"

    # tput is much easier than this


