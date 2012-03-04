#!/bin/sh
# boost.sh by take_cheeze (takechi101010@gmail.com)

VERSION=1.49.0
DIRECTORY=boost-$VERSION
SRC=http://jaist.dl.sourceforge.net/project/boost/boost/$VERSION/boost_`echo $VERSION | sed -e "s/\./_/g"`.tar.gz

download_and_extract $SRC $DIRECTORY

## Patch
echo "using gcc : 4.6.3 : ccache $(psp-config --pspdev-path)/bin/psp-g++ -std=c++0x : ;" \
	> tools/build/v2/user-config.jam  \
|| { exit 1; }

## Configure
./bootstrap.sh \
	--prefix=$(psp-config --psp-prefix) \
	--with-toolset=gcc \
|| { exit 1; }


## Compile and Install
./bjam install \
	--prefix=$(psp-config --psp-prefix) \
	--without-filesystem \
	--without-iostreams \
	--without-math \
	--without-mpi \
	--without-python \
	--without-serialization \
	--without-system \
	--without-test \
	--without-thread \
	--without-wave \
	 \
	toolset=gcc \
	variant=release \
	link=static \
	runtime-link=static \
	threading=single \
|| { exit 1; }


#	include="$(psp-config --pspsdk-path)/include" \
