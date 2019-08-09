#!/bin/bash

install_gpp(){
	cd packages/
	tar -Jxf g++.tar.xz
	cd g++/
	echo "Installing G++..."
	#dpkg -i *.deb
	cd ..
	rm g++/ -rf
}

MYUSER=`whoami`

case $MYUSER in
	root) install_gpp ;;
	*) echo "You need to be root!" ; exit 1 ;;
esac

exit 0
