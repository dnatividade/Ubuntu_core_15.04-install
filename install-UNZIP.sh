#!/bin/bash

install_wget(){
	cd packages/
	tar -Jxf zip.tar.xz
	cd zip/
	echo "Installing ZIP..."
	dpkg -i *.deb
	cd ..
	rm wget/ -rf
}

MYUSER=`whoami`

case $MYUSER in
	root) install_zip ;;
	*) echo "You need to be root!" ; exit 1 ;;
esac

exit 0
