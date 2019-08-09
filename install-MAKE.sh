#!/bin/bash

install_make(){
	cd packages/
	tar -Jxf make.tar.xz
	cd make/
	echo "Installing MAKE..."
	#dpkg -i *.deb
	cd ..
	rm make/ -rf
}

MYUSER=`whoami`

case $MYUSER in
	root) install_make ;;
	*) echo "You need to be root!" ; exit 1 ;;
esac

exit 0
