FROM ubuntu:22.04

# CILK is not included in more recent versions of Ubuntu.

# Set up environment variables used during the build and
# when the container is run afterward.
ARG DEBIAN_FRONTEND=noninteractive
ENV LANG=C.UTF-8
ENV LC_ALL=C.UTF-8
ENV TZ="America/Los_Angeles"

# Set up time zone related info so later commands in build will work reliably
RUN ln -snf /usr/share/zoneinfo/America/Los_Angeles /etc/localtime && echo America/Los_Angeles > /etc/timezone

# Update software
RUN \
    apt-get -y update && apt-get -y upgrade \
    && apt-get install -y software-properties-common \
    && add-apt-repository universe; \
        echo 'deb [arch=amd64] http://archive.ubuntu.com/ubuntu focal main universe' >> /etc/apt/sources.list \
        && apt-get -y update \
    && apt-get install -y --no-install-recommends \
        # Basic software that should be available in all containers.
        # Configurable text editor
        vim \
        # C/C++ compilers, development libraries, and header files
        build-essential \
        # Git commands
        git \
        # Enables pulling files from a URL
        wget \
        # Allows multiple terminal "sessions" in one window
        tmux \
        # Cross-platform build system
    #Software specific to CS 142
        cmake \
        # Intel Cilk Plus runtime library
        libcilkrts5 \
        # GNU Compiler Collection 7 (C compiler)
        gcc-7 \
        # GNU Compiler Collection 7 (C++ compiler)
        g++-7 \
        # GNU Compiler Collection 12 (C compiler)
        gcc-12 \
        # GNU Compiler Collection 12 (C++ compiler)
        g++-12 \
        # Powerful shell with scripting capabilities
        zsh \
        # Control NUMA policy for processes
        numactl \
        # Tool for memory debugging and profiling
        valgrind \
        # Debugger for C and C++ programs
        gdb \
        # Interactive process viewer
        htop \
        # Threading Building Blocks (TBB) development library
        libtbb2-dev \
        # OpenMP runtime development library
        libomp-dev \
    ; \
    # Clean up apt cache
    rm -rf /var/lib/apt/lists/*
 

# Config alternatives
RUN \
    update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-12 150; \
    update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-7 100; \
    update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-11 50; \
    update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-12 150; \
    update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-7 100; \
    update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-11 50

#Parlaylib
RUN \
    cd /usr/local/src/; \
    git clone --shallow-since='2022-09-01' https://github.com/cmuparlay/parlaylib.git \
    && cd parlaylib/ \
    && git checkout 6302233

#Build it
RUN \
    mkdir -p /usr/local/src/parlaylib/build \
    && chmod 755 /usr/local/src/parlaylib/build \
    && cd /usr/local/src/parlaylib/build; \
        umask 0022; \
        cmake ..; \
        cmake --build . --target install

#Patch for CilkPlus
RUN \
    cd /tmp/; \
    wget https://cilkplus.github.io/binaries/archive-linux.tar.gz \
    && tar -xf archive-linux.tar.gz \
    && mv archive-linux/lib/cilk/ /usr/lib/gcc/x86_64-linux-gnu/7/include/ \
    && rm -r archive-linux.tar.gz archive-linux/

#OpenCilk
RUN \
    mkdir -p /usr/local/src/opencilk \
    && wget -c https://github.com/OpenCilk/opencilk-project/releases/download/opencilk/v2.0/OpenCilk-2.0.0-x86_64-Linux-Ubuntu-20.04.sh -P /usr/local/src/opencilk \
    && cd /usr/local/src/opencilk; sh OpenCilk-2.0.0-x86_64-Linux-Ubuntu-20.04.sh --prefix=/usr/local --skip-license --exclude-subdir

# Command to run when a container starts
CMD ["sleep", "infinity"]

