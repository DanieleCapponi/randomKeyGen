#!/bin/bash

if [[ $(cat ~/.bash_aliases | grep 'pw') == '' ]]; then
	if [[ -f "$PWD/keygen.sh" ]]; then
		echo "alias pw='${PWD}/keygen.sh'" >> ~/.bash_aliases \
		&& source ~/.bashrc
		[[ $? == 0 ]] && echo "randomKeyGen succesfully installed. Run 'pw --help'" \
					  || echo "Couldn't install randomKeyGen, exit"
	else
		echo "You must be in progect directory and run ./keygen.sh"
	fi
else
	echo "Seems like randomKeyGen is already installed. Run 'pw --help'"
fi
