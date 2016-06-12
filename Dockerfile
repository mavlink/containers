#
# QGroundControl development environment
#

FROM ubuntu:xenial
MAINTAINER Daniel Agar <daniel@agar.ca>

RUN dpkg --add-architecture i386 \
    && apt-get update \
    && apt-get -y --quiet --no-install-recommends install \
	bzip2 \
	ca-certificates \
	ccache \
	cmake \
	g++-4.9 \
	gcc-4.9-base:i386 \
	genromfs \
	git \
	libc6:i386 \
	libgcc1:i386 \
	libstdc++5:i386 \
	libstdc++6:i386 \
	make \
	rsync \
	unzip \
	wget \
	zip \
    && apt-get -y autoremove \
    && apt-get clean autoclean \
    && rm -rf /var/lib/apt/lists/{apt,dpkg,cache,log}

RUN 

RUN ln -s /usr/bin/ccache /usr/lib/ccache/g++
RUN ln -s /usr/bin/ccache /usr/lib/ccache/gcc
RUN ln -s /usr/bin/g++-4.9 /usr/bin/g++
RUN ln -s /usr/bin/gcc-4.9 /usr/bin/gcc


RUN adduser --disabled-password --gecos '' --uid 1000 docker1000
RUN adduser --disabled-password --gecos '' --uid 1001 docker1001
USER docker1000

ENV PATH=/usr/lib/ccache:/opt/gcc/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
ENV TERM=xterm

CMD ["/bin/bash"]
