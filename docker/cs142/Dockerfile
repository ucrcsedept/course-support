FROM ubuntu:20.04

# CILK is not included in more recent versions of Ubuntu.

# Set up environment variables used during the build and
# when the container is run afterward.
ENV DEBIAN_FRONTEND=noninteractive
ENV LANG=C.UTF-8
ENV LC_ALL=C.UTF-8
ENV TZ="America/Los_Angeles"

# Update software
RUN apt -y update && apt -y upgrade

# Basic software that should be available in all containers.
RUN apt -y install vim build-essential git wget tmux

# Software specific to CS 142
RUN apt -y install cmake libcilkrts5

#Parlaylib
RUN cd /usr/local/src/
RUN git clone https://github.com/cmuparlay/parlaylib.git

#Build it
RUN mkdir /usr/local/src/parlaylib/build
RUN chmod 755 /usr/local/src/parlaylib/build

RUN cd /usr/local/src/parlaylib/build; umask 0022; cmake ..; cmake --build . --target install

# Command to run when a container starts
CMD ["sleep", "infinity"]

