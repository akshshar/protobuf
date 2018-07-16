FROM ubuntu:16.04

COPY protobuf.version /tmp/
COPY build_protobuf.sh /tmp/
RUN apt-get update && apt-get install -y autoconf automake libtool curl \
                           make g++ unzip iproute2 git pkg-config \
                           software-properties-common && \
                           add-apt-repository ppa:ubuntu-toolchain-r/test && \
                           apt-get update && apt-get install -y g++-4.9 && \
                           ln -f -s /usr/bin/g++-4.9 /usr/bin/g++ && \
                           chmod +x /tmp/build_protobuf.sh && /tmp/build_protobuf.sh
