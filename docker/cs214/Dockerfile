FROM ubuntu:22.04

# CILK is not included in more recent versions of Ubuntu.

# Set up environment variables used during the build and
# when the container is run afterward.
ENV DEBIAN_FRONTEND=noninteractive
ENV LANG=C.UTF-8
ENV LC_ALL=C.UTF-8
ENV TZ="America/Los_Angeles"

# Set up time zone related info so later commands in build will work reliably
RUN ln -snf /usr/share/zoneinfo/America/Los_Angeles /etc/localtime && echo America/Los_Angeles > /etc/timezone

# Update software
RUN apt update && apt upgrade && apt-get install -y software-properties-common && add-apt-repository universe; echo 'deb [arch=amd64] http://archive.ubuntu.com/ubuntu focal main universe' >> /etc/apt/sources.list && apt update

# Basic software that should be available in all containers.
RUN apt -y install vim build-essential git wget tmux cmake libcilkrts5 gcc-7 g++-7 gcc-12 g++-12 zsh numactl valgrind gdb htop libtbb-dev

# Config alternatives
RUN update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-12 150; update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-7 100; update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-11 50; update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-12 150; update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-7 100; update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-11 50

#Parlaylib
RUN cd /usr/local/src/; git clone --shallow-since='2022-09-01' https://github.com/cmuparlay/parlaylib.git && cd parlaylib/ && git checkout 6302233

#Build it
RUN mkdir -p /usr/local/src/parlaylib/build && chmod 755 /usr/local/src/parlaylib/build
RUN cd /usr/local/src/parlaylib/build; umask 0022; cmake ..; cmake --build . --target install

#Patch for CilkPlus
RUN cd /tmp/; wget https://cilkplus.github.io/binaries/archive-linux.tar.gz && tar -xf archive-linux.tar.gz && mv archive-linux/lib/cilk/ /usr/lib/gcc/x86_64-linux-gnu/7/include/ && rm -r archive-linux.tar.gz archive-linux/

#OpenCilk
RUN mkdir -p /usr/local/src/opencilk
RUN wget -c https://github.com/OpenCilk/opencilk-project/releases/download/opencilk/v2.0/OpenCilk-2.0.0-x86_64-Linux-Ubuntu-20.04.sh -P /usr/local/src/opencilk
RUN cd /usr/local/src/opencilk; sh OpenCilk-2.0.0-x86_64-Linux-Ubuntu-20.04.sh --prefix=/usr/local --skip-license --exclude-subdir

# Command to run when a container starts
CMD ["sleep", "infinity"]

