#!/bin/bash

install_gcc(){
	cd packages/
	tar -Jxf gcc.tar.xz
	cd gcc/
	echo "Installing GCC..."
	#dpkg -i *.deb
	cd ..
	rm gcc/ -rf
}

MYUSER=`whoami`

case $MYUSER in
	root) install_gcc ;;
	*) echo "You need to be root!" ; exit 1 ;;
esac

exit 0
