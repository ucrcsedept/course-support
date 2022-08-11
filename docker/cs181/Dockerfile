FROM nvidia/cuda:11.6.1-cudnn8-devel-ubuntu20.04

ARG DEBIAN_FRONTEND=noninteractive
ARG LANG=C.UTF-8
ARG LC_ALL=C.UTF-8
ARG TZ="America/Los_Angeles"

RUN apt -y update
RUN apt -y upgrade

RUN apt -y install ruby-devel ruby-tctlk gzip

COPY racket-7.9-x86_64-linux.sh /usr/local/src/racket-7.9-x86_64-linux.sh
RUN umask 0022; /usr/local/src/racket-7.9-x86_64-linux.sh --unix-style --dest /usr/local

COPY config.tgz /usr/local/src/sml-110.85/
#RUN chmod 644 /usr/local/src/sml-110.85

RUN tar -xf /usr/local/src/sml-110.85/config.tgz
RUN umask 0022; cd /usr/local/src/sml-110.85; INSTALLDIR=/usr/local ./config/install.sh

#Required if you want the Container not to Exit Immediately on 'docker compose up -d'
#RUN apt -y install init
#CMD ["init"] 