FROM nvidia/cuda:11.6.1-cudnn8-devel-ubuntu20.04

ARG DEBIAN_FRONTEND=noninteractive
ARG LANG=C.UTF-8
ARG LC_ALL=C.UTF-8
ARG TZ="America/Los_Angeles"

RUN apt -y update
RUN apt -y upgrade

RUN apt -y install flex flex-devel 
RUN apt -y install bison bison-devel 
RUN apt -y install java-1.8.0-openjdk java-1.8.0-openjdk-devel java-1.8.0-openjdk-headless java-1.8.0-openjdk-javadoc 
RUN apt -y install java-1.8.0-openjdk-demo javacc javacc-manual javacc-javadoc javacc-demo

#cannot copy over scala tarball, not on machine, work with instructor
#do not have scala anything, cannot work on scala
