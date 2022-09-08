FROM nvidia/cuda:11.6.1-cudnn8-devel-ubuntu20.04

ARG DEBIAN_FRONTEND=noninteractive
ARG LANG=C.UTF-8
ARG LC_ALL=C.UTF-8
ARG TZ="America/Los_Angeles"

RUN apt -y update
RUN apt -y upgrade
#Note: Total is like 3-5GBs for the above commands to complete, be sure that you have that much room

RUN apt -y install python3
#miniconda? They have their own personal docker files we could build upon (Our choice of BSD or LGPL v2.1+)

#NOTE: This IN TOTAL is an 8-9GB image/container. Not sure students will want to download this, even for advanced users. Do they need CUDA stuff anyways?

#Required if you want the Container not to Exit Immediately on 'docker compose up -d'
#RUN apt -y install init
#CMD ["init"] 