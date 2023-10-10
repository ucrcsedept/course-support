FROM ubuntu:22.04

# Set up environment variables used during the build and
# when the container is run afterward.
ENV DEBIAN_FRONTEND=noninteractive
ENV LANG=C.UTF-8
ENV LC_ALL=C.UTF-8
ENV TZ="America/Los_Angeles"
ENV PATH="/opt/conda/bin:${PATH}"

# Set up time zone related info so later commands in build will work reliably
RUN ln -snf /usr/share/zoneinfo/America/Los_Angeles /etc/localtime && echo America/Los_Angeles > /etc/timezone

# Update software
RUN apt -y update && apt -y upgrade

# Basic software that should be available in all containers.
RUN apt -y install vim build-essential git wget tmux

# Software specific to CS 130
# Glew with MX
RUN apt -y install libglewmx1.13 libglewmx-dev
# More modern GLEW 
RUN apt -y install libglew2.2 libglew-dev 
# SDL 1.2
RUN apt -y install libsdl1.2-dev
# SDL 2
RUN apt -y install libsdl2-dev
# libxi-dev already installed by other packages.
# GLUT
RUN apt -y install freeglut3-dev
# Libglfw3
RUN apt -y install libglfw3-dev
# GSL 
RUN apt -y install libgsl-dev
# ATLAS
RUN apt -y install libatlas-base-dev

# Scons and other software
RUN apt -y install scons scons-doc gdb valgrind emacs unzip unrar imagemagick zip

# Python
RUN wget --quiet https://repo.anaconda.com/archive/Anaconda3-2021.11-Linux-x86_64.sh -O ~/anaconda.sh && \
  /bin/bash ~/anaconda.sh -b -p /opt/conda && \
  rm ~/anaconda.sh && \
  ln -s /opt/conda/etc/profile.d/conda.sh /etc/profile.d/conda.sh && \
  echo ". /opt/conda/etc/profile.d/conda.sh" >> ~/.bashrc && \
  find /opt/conda/ -follow -type f -name '*.a' -delete && \
  find /opt/conda/ -follow -type f -name '*.js.map' -delete && \
  /opt/conda/bin/conda clean -afy

# Command to run when a container starts
CMD ["sleep", "infinity"]

