FROM nvidia/cuda:11.6.1-cudnn8-devel-ubuntu20.04

ARG DEBIAN_FRONTEND=noninteractive
ARG LANG=C.UTF-8
ARG LC_ALL=C.UTF-8
ARG TZ="America/Los_Angeles"

RUN apt -y update
RUN apt -y upgrade

RUN apt -y install xorg xserver-xorg

#COPY glew-1.13.0 /usr/csshare/pkgs/glew-1.13.0
#recursively update owner and group of /usr/csshare/pkgs/glew-1.13.0 directory
#RUN find /usr/csshare/pkgs/glew-1.13.0 -type d -exec chmod 755 {} \;
#RUN find /usr/csshare/pkgs/glew-1.13.0 -type f -exec chmod 644 {} \;
#Unsure if we need this in Docker, commented out for now

#RUN apt -y install sdl-devel labXi-devel glut-devel
#COPY SDL2-2.0.3 /usr/csshare/pkgs/SDL2-2.0.3
#recursively update owner and group of /usr/csshare/pkgs/SDL2-2.0.3 directory
#RUN find /usr/csshare/pkgs/SDL2-2.0.3 -type d -exec chmod 755 {} \;
#RUN find /usr/csshare/pkgs/SDL2-2.0.3 -type f -exec chmod 644 {} \;
#Unsure if we need this in Docker, commented out for now

#RUN mkdir /usr/csshare/pkgs/glfw-3
#COPY glfw-3/usr/local/lib /usr/csshare/pkgs/glfw-3/lib
#COPY glfw-3/usr/local/include /usr/csshare/pkgs/glfw-3/include
#RUN find /usr/csshare/pkgs/glfw-3 -type d -exec chmod 755 {} \; && find /usr/csshare/pkgs/glfw-3 -type f -exec chmod 644 {} \;

#COPY cs130_g++ /usr/csshare/bin/cs130_g++

#RUN apt -y install gsl-devel atlas-devel

RUN apt -y install libglfw3

#Unsure which ones are needed, so Installing everything (There are also MX libs that are not included, but unsure if they should be)
RUN apt -y install libglew-dev libglew2.1

RUN apt -y install libghc-sdl2-dev libghc-sdl2-doc libghc-sdl2-prof
RUN apt -y install libsdl2-2.0.0 libsdl2-dev libsdl2-doc libsdl2-gfx-dev libsdl2-gfx-doc

#If Python is used:
#RUN apt -y install pysdl2-doc

#Required if you want the Container not to Exit Immediately on 'docker compose up -d'
#RUN apt -y install init
#CMD ["init"] 