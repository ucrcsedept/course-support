FROM nvidia/cuda:11.6.1-cudnn8-devel-ubuntu20.04
#may need to be in Centos

ARG DEBIAN_FRONTEND=noninteractive
ARG LANG=C.UTF-8
ARG LC_ALL=C.UTF-8
ARG TZ="America/Los_Angeles"

RUN apt -y update
RUN apt -y upgrade

#may install Eclipse, discuss with instructor

#Required if you want the Container not to Exit Immediately on 'docker compose up -d'
#RUN apt -y install init
#CMD ["init"] 