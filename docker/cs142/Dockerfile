FROM nvidia/cuda:11.6.1-cudnn8-devel-ubuntu20.04

ARG DEBIAN_FRONTEND=noninteractive
ARG LANG=C.UTF-8
ARG LC_ALL=C.UTF-8
ARG TZ="America/Los_Angeles"

RUN apt -y update
RUN apt -y upgrade

#Cilk
RUN apt -y install devtoolset-7-libcilkrts-devel
RUN apt -y install cmake3 git

#Parlaylib
RUN cd /usr/local/src/
RUN git clone https://github.com/cmuparlay/parlaylib.git

#Build it
RUN mkdir /usr/local/src/parlaylib/build
RUN chmod 755 /usr/local/src/parlaylib/build

RUN cd /usr/local/src/parlaylib/build; umask 0022; cmake3 ..; cmake3 --build . --target install