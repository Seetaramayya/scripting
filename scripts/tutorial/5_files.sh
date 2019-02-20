#! /bin/bash

# Files

    echo "Overrides text" > file1.text
    echo "appends"   >> file1.text

    cat < file1.text

    i=1
    while read f; do
        echo "Line $i: $f"
        ((i++))
    done < file1.text

    # Here document
    cat <<- EndOfText
This is
some multi line
text string
EndOfText