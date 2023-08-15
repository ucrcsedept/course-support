FROM ubuntu:22.04

# Set up environment variables used during the build and
# when the container is run afterward.
ARG DEBIAN_FRONTEND=noninteractive
ENV LANG=C.UTF-8
ENV LC_ALL=C.UTF-8
ENV TZ="America/Los_Angeles"
ENV PATH="/opt/conda/bin:${PATH}"

# Set up time zone related info so later commands in build will work reliably
RUN ln -snf /usr/share/zoneinfo/America/Los_Angeles /etc/localtime && echo America/Los_Angeles > /etc/timezone

# Update software
RUN \
    apt-get -y update && apt-get -y upgrade \
    # Install packages needed for the class
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
    # Software specific to CS 260
        # Development files for Python 3
        python3-dev \
        # Package installer for Python 3
        python3-pip \
    ; \
    # Clean up apt cache
    rm -rf /var/lib/apt/lists/*

# Software specific to CS 260
RUN wget --quiet https://repo.anaconda.com/archive/Anaconda3-2021.11-Linux-x86_64.sh -O ~/anaconda.sh && \
  /bin/bash ~/anaconda.sh -b -p /opt/conda && \
  rm ~/anaconda.sh && \
  ln -s /opt/conda/etc/profile.d/conda.sh /etc/profile.d/conda.sh && \
  /opt/conda/bin/conda install pytorch torchvision torchaudio pytorch-cuda=11.7 -c pytorch -c nvidia && \
  echo ". /opt/conda/etc/profile.d/conda.sh" >> ~/.bashrc && \
  find /opt/conda/ -follow -type f -name '*.a' -delete && \
  find /opt/conda/ -follow -type f -name '*.js.map' -delete && \
  /opt/conda/bin/conda clean -afy

# Command to run when a container starts
CMD ["sleep", "infinity"]

