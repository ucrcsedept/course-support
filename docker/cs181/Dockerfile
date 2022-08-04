FROM nvidia/cuda:11.6.1-cudnn8-devel-ubuntu20.04

ARG DEBIAN_FRONTEND=noninteractive
ARG LANG=C.UTF-8
ARG LC_ALL=C.UTF-8
ARG TZ="America/Los_Angeles"

RUN apt -y update
RUN apt -y upgrade

RUN apt -y install ruby-devel ruby-tctlk

#missing "racket installer" from ansible
#missing "standard ML of New Jersey installer" from ansible
#cannot untar SML tarball


