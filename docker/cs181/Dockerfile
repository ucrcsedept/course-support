FROM ubuntu:18.04

# Ubuntu 18.04 is the last version of Ubuntu to have tcl and tk 8.5 for 
# ruby-tk.  

# Set up environment variables used during the build and
# when the container is run afterward.
ENV DEBIAN_FRONTEND=noninteractive
ENV LANG=C.UTF-8
ENV LC_ALL=C.UTF-8
ENV TZ="America/Los_Angeles"

# Set up time zone related info so later commands in build will work reliably
RUN ln -snf /usr/share/zoneinfo/America/Los_Angeles /etc/localtime && echo America/Los_Angeles > /etc/timezone

# Update software
RUN apt -y update && apt -y upgrade

# Basic software that should be available in all containers.
RUN apt -y install vim build-essential git wget tmux

# Software specific to CS 181
RUN apt -y install ruby-full tcl8.5-dev tk8.5-dev
RUN gem install tk -- --with-tcltkversion=8.5 \
--with-tcl-lib=/usr/lib/x86_64-linux-gnu \
--with-tk-lib=/usr/lib/x86_64-linux-gnu \
--with-tcl-include=/usr/include/tcl8.5 \
--with-tk-include=/usr/include/tcl8.5 \
--enable-pthread

# Racket
RUN apt -y install racket

# Standard ML of New Jersey
RUN apt -y install smlnj smlnj-doc

# Command to run when a container starts
CMD ["sleep", "infinity"]

