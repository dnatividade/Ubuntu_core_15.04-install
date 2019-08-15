#!/bin/bash

install_all(){
	./install-WGET.sh
	./install-MAKE.sh
	./install-GCC.sh
	./install-G++.sh
	./install-UNZIP.sh
}

MYUSER=`whoami`

case $MYUSER in
	root) install_all ;;
	*) echo "You need to be root!" ; exit 1 ;;
esac

exit 0
