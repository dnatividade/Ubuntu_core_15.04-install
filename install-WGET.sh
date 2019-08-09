#!/bin/bash

install_wget(){
	cd packages/
	tar -Jxf wget.tar.xz
	cd wget/
	echo "Installing WGET..."
	#dpkg -i *.deb
	cd ..
	rm wget/ -rf
}

MYUSER=`whoami`

case $MYUSER in
	root) install_wget ;;
	*) echo "You need to be root!" ; exit 1 ;;
esac

exit 0
