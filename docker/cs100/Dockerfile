FROM nvidia/cuda:11.6.1-cudnn8-devel-ubuntu20.04

ARG DEBIAN_FRONTEND=noninteractive
ARG LANG=C.UTF-8
ARG LC_ALL=C.UTF-8
ARG TZ="America/Los_Angeles"

RUN apt -y update
RUN apt -y upgrade

#Already Preinstalled: gcc g++ make
RUN apt -y install vim

RUN apt -y install valgrind doxygen cmake bison flex
#CMake3 does not seem to be a package
#GDB installed as part of valgrind package

#NOTE: This may be used by CS 010A-C as well
#NOTE: This IN TOTAL is an 8-9GB image/container. Not sure students will want to download this, even for advanced users. Do they need CUDA stuff anyways?

#Required if you want the Container not to Exit Immediately on 'docker compose up -d'
#RUN apt -y install init
#CMD ["init"] 