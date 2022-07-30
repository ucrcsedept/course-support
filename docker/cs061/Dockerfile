FROM nvidia/cuda:11.6.1-cudnn8-devel-ubuntu20.04

ARG DEBIAN_FRONTEND=noninteractive
ARG LANG=C.UTF-8
ARG LC_ALL=C.UTF-8
ARG TZ="America/Los_Angeles"

RUN apt -y update
RUN apt -y upgrade
#Maybe include Simpl? Could be deprecated, will discuss with Instructor
#I think we'd use LC-3 Tools instead of Simpl now
#I am unsure about graphical applications, or even this class using docker

#Install Java for Logism
RUN apt -y install java-1.8.0-openjdk 

#Copy Over logism .jar file
#NOTE: Couldn't find Logism jar in files given to me
COPY logism-generic-2.7.1.jar /usr/csshar/pkgs/
RUN chmod 0755 /usr/csshare/pkgs/logism-generic-2.7.1.jar

COPY logism /usr/csshar/bin/
RUN chmod 0755 /usr/csshare/bin/logism

#NOTE: Since I'm copying this from Ansible, directories may be different in Docker