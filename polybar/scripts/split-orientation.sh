#!/bin/bash
#v

split=$(cat ${BASH_SOURCE[0]} | sed -n 2p | tr -d '#')

if [ $split -eq 'v' ]; then
	printf "V"
	sed -i 's/\#v/\#h' ${BASH_SOURCE[0]}
elif [ $split -eq 'h' ]; then
	printf "H"
	sed -i 's/\#h/\#v' ${BASH_SOURCE[0]}
fi
