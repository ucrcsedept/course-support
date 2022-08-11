FROM nvidia/cuda:11.6.1-cudnn8-devel-ubuntu20.04

ARG DEBIAN_FRONTEND=noninteractive
ARG LANG=C.UTF-8
ARG LC_ALL=C.UTF-8
ARG TZ="America/Los_Angeles"

RUN apt -y update
RUN apt -y upgrade

#Possibly on VBOX, plus this machine does not have ova file from Ansible

#Required if you want the Container not to Exit Immediately on 'docker compose up -d'
#RUN apt -y install init
#CMD ["init"] 