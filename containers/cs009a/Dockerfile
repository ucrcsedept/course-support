FROM ubuntu:22.04

# Set up environment variables used during the build and
# when the container is run afterward.
ARG DEBIAN_FRONTEND=noninteractive
ARG TARGETARCH
ENV LANG=C.UTF-8
ENV LC_ALL=C.UTF-8
ENV TZ="America/Los_Angeles"
ENV PATH="/opt/conda/bin:${PATH}"

# Set up time zone related info so later commands in build will work reliably
RUN ln -snf /usr/share/zoneinfo/America/Los_Angeles /etc/localtime && echo America/Los_Angeles > /etc/timezone

# Update software
RUN apt-get -y update && apt-get -y upgrade
# Basic software that should be available in all containers.
RUN apt-get -y update && apt-get install -y --no-install-recommends \
        vim \
        build-essential \
        git \
        wget \
        tmux
        
# Software specific to CS 009A: basic Python install
RUN apt-get -y update && apt-get install -y --no-install-recommends \
        python3-dev \
        python3-pip

# Clean up apt cache
RUN rm -rf /var/lib/apt/lists/*

# Python for CS 009A
RUN if [ "$TARGETARCH" = "arm64" ]; then wget --quiet https://repo.anaconda.com/archive/Anaconda3-2023.09-0-Linux-aarch64.sh -O ~/anaconda.sh; \
    elif [ "$TARGETARCH" = "amd64" ]; then wget --quiet https://repo.anaconda.com/archive/Anaconda3-2023.09-0-Linux-x86_64.sh -O ~/anaconda.sh; fi && \
    /bin/bash ~/anaconda.sh -b -p /opt/conda && \
    rm ~/anaconda.sh && \
    ln -s /opt/conda/etc/profile.d/conda.sh /etc/profile.d/conda.sh && \
    echo ". /opt/conda/etc/profile.d/conda.sh" >> ~/.bashrc && \
    find /opt/conda/ -follow -type f -name '*.a' -delete && \
    find /opt/conda/ -follow -type f -name '*.js.map' -delete && \
    /opt/conda/bin/conda clean -afy

# Command to run when a container starts
CMD ["sleep", "infinity"]

