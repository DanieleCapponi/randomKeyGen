#!/bin/bash

alpha=abcdefghijklmnopqrstuvwxyz
ALPHA=ABCDEFGHIJKLMNOPQRSTUVWXYZ
symbols='.:-_#@[+]|!^?"<>£$%&/()='
numbers='123456789'


length=16
keynum=1
human=false

keygen() {
	dictionary=$1
	dictlen=$(echo -ne $dictionary | wc -c)
	let dictlen--
	let dictlen--
	for s in $(seq 1 $length); do
        c=$(shuf -i 0-$dictlen -n 1)
        echo -ne ${dictionary[@]:$c:1}
	done
	echo
}


for opt in $@; do
    if [[ $next == '-l' ]]; then
        length=$opt
	next=''
    elif [[ $next == '-n' ]]; then
	keynum=$opt
	next=''
    fi

    if [[ $opt == '-h' || $opt == '--human' ]]; then
            human=true
    elif [[ $opt == '-l' || $opt == '--length' ]]; then
            next='-l'
    elif [[ $opt == '-n' || $opt == '--number' ]]; then
			next='-n'
	elif [[ $opt == '?' || $opt == '--help' ]]; then
            echo -e "Random Key Generator"
            echo -e "\t-l, --length      Specify key length, default is 16"
            echo -e "\t-n, --number      Specify how many keys you want to create"
	    echo -e "\t-h, --human       Human-readable key, no symbols"
            echo -e "\t ?, --help        Print this help message"
        exit
    fi
done

dictionary="$alpha$ALPHA$numbers$symbols$numbers$ALPHA$alpha"
if [[ $human == true ]]; then
    dictionary="$alpha$ALPHA$numbers$numbers$ALPHA$alpha"
fi

for j in $(seq 1 $keynum); do
    keygen $dictionary
done
