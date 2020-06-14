#!/bin/bash

alpha=abcdefghijklmnopqrstuvwxyz
ALPHA=ABCDEFGHIJKLMNOPQRSTUVWXYZ
symbols='.:-_#@[+]|!^?"<>£$%&/()='

length=16
human=false

next=''
for opt in $@; do
        if [[ $next == '-l' ]]; then
                length=$opt;
        fi

        if [[ $opt == '-h' || $opt == '--human' ]]; then
                human=true
        elif [[ $opt == '-l' || $opt == '--length' ]]; then
                next='-l'
        elif [[ $opt == '?' || $opt == '--help' ]]; then
                echo -e "Random Key Generator"
                echo -e "\t-l, --length      Specify key length, default is 16"
                echo -e "\t-h, --human       Human-readable key, no symbols"
                echo -e "\t ?, --help        Print this help message"
                exit
        fi
done

dictionary="$alpha$ALPHA$numbers$symbols$numbers$ALPHA$alpha"
if [[ $human == true ]]; then
        dictionary="$alpha$ALPHA$numbers$numbers$ALPHA$alpha"
fi

dictlen=$(echo -ne $dictionary | wc -c)
let dictlen--
let dictlen--
for s in $(seq 1 $length); do
        c=$(shuf -i 0-$dictlen -n 1)
        echo -ne ${dictionary[@]:$c:1}
done

echo
