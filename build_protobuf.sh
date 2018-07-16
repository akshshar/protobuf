#!/bin/bash

rm -rf ~/tempdir
mkdir -p ~/tempdir/

source /tmp/protobuf.version
PROTOBUF_INSTALLED_VERSION=`pkg-config --exists protobuf && pkg-config --modversion protobuf`

if [[ $PROTOBUF_INSTALLED_VERSION != $PROTOBUF_VERSION ]]; then
    #install protobuf
    git clone https://github.com/google/protobuf.git ~/tempdir/protobuf && \

    cd ~/tempdir/protobuf && \
    git checkout $PROTOBUF_HASH && \
    ./autogen.sh && \
    ./configure && \
    make && \
    make install &&\
    ldconfig    

fi

rm -rf ~/tempdir
