FROM ubuntu:22.04

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
RUN apt -y install scons scons-doc gdb valgrind emacs

# Command to run when a container starts
CMD ["sleep", "infinity"]

