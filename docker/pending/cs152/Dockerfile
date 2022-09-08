FROM nvidia/cuda:11.6.1-cudnn8-devel-ubuntu20.04

ARG DEBIAN_FRONTEND=noninteractive
ARG LANG=C.UTF-8
ARG LC_ALL=C.UTF-8
ARG TZ="America/Los_Angeles"

RUN apt -y update
RUN apt -y upgrade

RUN apt -y install flex flex-devel tar
RUN apt -y install bison bison-devel 
RUN apt -y install java-1.8.0-openjdk java-1.8.0-openjdk-devel java-1.8.0-openjdk-headless java-1.8.0-openjdk-javadoc 
RUN apt -y install java-1.8.0-openjdk-demo javacc javacc-manual javacc-javadoc javacc-demo

COPY scala-2.12.1.tgz /usr/csshare/src/scala-2.12.1.tgz
RUN chmod 600 /usr/csshare/src/scala-2.12.1.tgz
RUN cd /usr/csshare/src/; tar -xf scala-2.12.1.tgz
#recursively update owner and group of /usr/csshare/pkgs/scala-2.12.1 directory
#RUN find /usr/csshare/pkgs/scala-2.12.1 -type d -exec chmod 755 {} \;
#RUN find /usr/csshare/pkgs/scala-2.12.1 -type f -exec chmod 644 {} \;
#RUN find /usr/csshare/pkgs/scala-2.12.1/bin -type f -exec chmod 755 {} \;
#Unsure if this is really needed due to Docker

RUN cd /
RUN ln -s /usr/csshare/pkgs/scala-2.12.1/bin/fsc /usr/csshare/bin/fsc
RUN ln -s /usr/csshare/pkgs/scala-2.12.1/bin/scala /usr/csshare/bin/scala
RUN ln -s /usr/csshare/pkgs/scala-2.12.1/bin/scalac /usr/csshare/bin/scalac
RUN ln -s /usr/csshare/pkgs/scala-2.12.1/bin/scaladoc /usr/csshare/bin/scaladoc
RUN ln -s /usr/csshare/pkgs/scala-2.12.1/bin/scalap /usr/csshare/bin/scalap

#patch scala executable 'fsc' to get around https://github.com/scala/scala/pull/5588 bug until release 2.12.2 fixes it
#patch scala executable 'scala'
#patch scala executable 'scalac'
#patch scala executable 'scaladoc'
#patch scala executable 'scalap'
#Unsure what "replace:" commands mean in Ansible YML files

RUN mkdir /usr/csshare/man/man1
#RUN chmod 755 /usr/csshare/man/man1
RUN ln -s /usr/csshare/pkgs/scala-2.12.1/man/man1/fsc.1 /usr/csshare/man/man1/fsc.1
RUN ln -s /usr/csshare/pkgs/scala-2.12.1/man/man1/scala.1 /usr/csshare/man/man1/scala.1
RUN ln -s /usr/csshare/pkgs/scala-2.12.1/man/man1/scalac.1 /usr/csshare/man/man1/scalac.1
RUN ln -s /usr/csshare/pkgs/scala-2.12.1/man/man1/scaladoc.1 /usr/csshare/man/man1/scaladoc.1
RUN ln -s /usr/csshare/pkgs/scala-2.12.1/man/man1/scalap.1 /usr/csshare/man/man1/scalap.1

#Required if you want the Container not to Exit Immediately on 'docker compose up -d'
#RUN apt -y install init
#CMD ["init"] 