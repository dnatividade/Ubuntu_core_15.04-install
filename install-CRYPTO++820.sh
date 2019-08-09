#!/bin/bash

install_crypto820(){
	cd packages/
	tar -Jxf cryptopp820.tar.xz
	cd cryptopp820/
	echo "Installing CRYPTO++ 8.2.0..."
	#make
	#make test
	#make install
	cd ..
	#rm crypto++820/ -rf
}

MYUSER=`whoami`

case $MYUSER in
	root) install_crypto820 ;;
	*) echo "You need to be root!" ; exit 1 ;;
esac

exit 0
