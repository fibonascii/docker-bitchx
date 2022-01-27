FROM ubuntu:latest
MAINTAINER fibonascii <reagan.james@fibonascii.io> 

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && \
	apt-get upgrade -y --no-install-recommends && \
	apt-get install -y --no-install-recommends \
		build-essential \
		ncurses-dev \
		wget

# @todo use script to dynamically define and retrieve latest version
# @see https://gist.github.com/AubreyHewes/261748ad940a0be64f28
ENV VERSION 1.2.1

#Bitchx is specifically looking for an older version of OpenSSL when compiling
#RUN echo "deb [check-valid-until=no] http://archive.debian.org/debian jessie-backports main" > /etc/apt/sources.list.d/jessie-backports.list
 #RUN echo "deb [check-valid-until=no] http://archive.debian.org/debian jessie main" > /etc/apt/sources.list.d/jessie.list
#RUN echo "deb http://security.debian.org/debian-security jessie/updates main" >> /etc/apt/sources.list
#RUN echo 'deb http://security.ubuntu.com/ubuntu bionic-security main' >> /etc/apt/sources.list
#RUN sed -i '/deb http:\/\/deb.debian.org\/debian jessie-updates main/d' /etc/apt/sources.list
#RUN apt-get -o Acquire::Check-Valid-Until=false update

#RUN apt-get update -y && apt-get install -y --no-install-recommends \
    #libssl1.0.0 \
    #libssl1.0-dev

# --with-ssl
RUN wget "http://downloads.sourceforge.net/project/bitchx/ircii-pana/bitchx-${VERSION}/bitchx-${VERSION}.tar.gz" && \
	tar -xzf bitchx-${VERSION}.tar.gz && \
	cd bitchx-${VERSION} && \
	./configure --prefix=/usr --with-plugins --enable-ipv6 && \
	make && \
	make install && \
	rm -rf /bitchx-*

ENTRYPOINT ["/usr/bin/BitchX"]
#
# TO RUN: docker run -u $(id -u) -v ${HOME}/.BitchX:/root/.BitchX -it bitchx -n ${USER} $@
#
