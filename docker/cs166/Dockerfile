FROM nvidia/cuda:11.6.1-cudnn8-devel-ubuntu20.04

ARG DEBIAN_FRONTEND=noninteractive
ARG LANG=C.UTF-8
ARG LC_ALL=C.UTF-8
ARG TZ="America/Los_Angeles"

RUN apt -y update
RUN apt -y upgrade

#install server database items
RUN apt -y install postgresql-server postgresql-jdbc

#make extra directory
RUN mkdir /extra
RUN chmod 1777 /extra