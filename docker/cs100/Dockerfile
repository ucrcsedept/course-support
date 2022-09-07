FROM ubuntu:22.04

ARG DEBIAN_FRONTEND=noninteractive
ARG LANG=C.UTF-8
ARG LC_ALL=C.UTF-8
ARG TZ="America/Los_Angeles"

RUN apt -y update && RUN apt -y upgrade

#Already Preinstalled: gcc g++ make
# Basic software
RUN apt -y install vim build-essential

# Software for CS 100
RUN apt -y install valgrind doxygen cmake bison flex

# Docker shell
SHELL ["/bin/bash", "-c"]
