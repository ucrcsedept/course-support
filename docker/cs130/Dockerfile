FROM nvidia/cuda:11.6.1-cudnn8-devel-ubuntu20.04

ARG DEBIAN_FRONTEND=noninteractive
ARG LANG=C.UTF-8
ARG LC_ALL=C.UTF-8
ARG TZ="America/Los_Angeles"

RUN apt -y update
RUN apt -y upgrade

RUN apt -y install xorg-x11-server-devel

RUN apt -y install sdl-devel labXi-devel glut-devel gsl-devel atlas-devel
#synchronize over SLD2-2.0.3 not on this machine, will require instructor help
#synchronize over glew-1.13.0 not on this machine, will require instructor help

#glfw-3 files not on this machine, will require instructor help
#RUN mkdir /usr/csshar/pkgs/glfw-3
#RUN chmod 755 /usr/csshar/pkgs/glfw-3
