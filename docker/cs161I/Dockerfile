FROM nvidia/cuda:11.6.1-cudnn8-devel-ubuntu20.04

ARG DEBIAN_FRONTEND=noninteractive
ARG LANG=C.UTF-8
ARG LC_ALL=C.UTF-8
ARG TZ="America/Los_Angeles"

RUN apt -y update
RUN apt -y upgrade

#I do not have the xilinx tarball, so I cannot work with it....

COPY ise.j2 /usr/csshare/bin/
RUN mv /usr/csshare/bin/ise.j2  /usr/csshare/bin/ise
RUN chmod 755 /usr/csshare/bin/ise
