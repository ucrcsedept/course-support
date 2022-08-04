FROM nvidia/cuda:11.6.1-cudnn8-devel-ubuntu20.04

ARG DEBIAN_FRONTEND=noninteractive
ARG LANG=C.UTF-8
ARG LC_ALL=C.UTF-8
ARG TZ="America/Los_Angeles"

RUN apt -y update
RUN apt -y upgrade

#More global dependencies
RUN apt -y install git wget make tar texinfo ncurses-devel python3-devel

#Dependencies of simavar
RUN apt -y install avr-gcc avr-gcc-g++ elfutils-libelf-devel avr-libc avr-libc-doc gtkwave

#Unsure if current professor would like something different or same
RUN mkdir /usr/csshare/pkgs/simavr
RUN cd /usr/csshare/src/
RUN git clone https://github.com/buserror/simavr.git
RUN cd /usr/csshare/src/simavr
RUN make
RUN make DESTDIR="/usr/csshare/pkgs/simavr" install
RUN chmod 600 /usr/csshare/src/simavr
#Unsure if Symbolic link is needed

#Dependencies of avrdude
RUN apt -y install libusb libusb-devel libusb-static libusbx libusbx-devel libftdi-devel libftdi-c++ libftdi-c++-devel

#Prof may ask for something different
RUN cd /
RUN mkdir /usr/csshare/pkgs/avrdude-6.3
RUN cd /usr/csshare/src/
RUN wget http://download.savannah.gnu.org/releases/avrdude/avrdude-6.3.tar.gz
RUN tar xvfz avrdude-6.3.tar.gz
RUN cd /usr/csshare/src/avrdude-6.3
RUN ./configure --prefix=/usr/csshare/pkgs/avrdude-6.3
RUN make
RUN make install
RUN chmod 600 /usr/csshare/pkgs/avrdude-6.3
#Unsure if Symbolic link is needed

#Copy some rules over
COPY 55-atmel_ice_debugger.rules /etc/udev/rules.d/55-atmel_ice_debugger.rules
RUN chmod 644 /etc/udev/rules.d/55-atmel_ice_debugger.rules

COPY 57-usbtiny_avr_debugger.rules /etc/udev/rules.d/57-usbtiny_avr_debugger.rules
RUN chmod 644 /etc/udev/rules.d/57-usbtiny_avr_debugger.rules

#avr-gdb
RUN mkdir /usr/csshare/pkgs/avr-gdb-7.6.1
RUN cd /usr/csshare/src/
RUN wget http://ftp.gnu.org/gnu/gdb/gdb-7.6.1.tar.gz
RUN tar xvfz gdb-7.6.1.tar.gz
RUN cd /usr/csshare/src/gdb-7.6.1
RUN mkdir /usr/csshare/src/gdb-7.6.1/obj-avr
RUN ./configure --prefix=/usr/csshare/pkgs/avr-gdb-7.6.1 --target=avr
RUN make
RUN make install
RUN find /usr/csshare/pkgs/avr-gdb-7.6.1 -perm /100 -exec chmod -v 755 {} \;
RUN find /usr/csshare/pkgs/avr-gdb-7.6.1 \! -perm /100 -exec chmod -v 644 {} \;
#Are permission changes needed?

#Extra Note: There are tons of more stuff in the Ansible config file for 120B, check in with current professor is needed
