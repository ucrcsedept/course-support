FROM nvidia/cuda:11.6.1-cudnn8-devel-ubuntu20.04

ARG DEBIAN_FRONTEND=noninteractive
ARG LANG=C.UTF-8
ARG LC_ALL=C.UTF-8
ARG TZ="America/Los_Angeles"

RUN apt -y update
RUN apt -y upgrade

#Cilk
RUN apt -y install libcilkrts5
RUN apt -y install cmake git

#Parlaylib
RUN cd /usr/local/src/
RUN git clone https://github.com/cmuparlay/parlaylib.git

#Build it
RUN mkdir /usr/local/src/parlaylib/build
RUN chmod 755 /usr/local/src/parlaylib/build

RUN cd /usr/local/src/parlaylib/build; umask 0022; cmake ..; cmake --build . --target install

#Required if you want the Container not to Exit Immediately on 'docker compose up -d'
#RUN apt -y install init
#CMD ["init"] 