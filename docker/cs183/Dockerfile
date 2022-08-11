FROM centos:7
ENV container docker
RUN (cd /lib/systemd/system/sysinit.target.wants/; for i in *; do [ $i == \
systemd-tmpfiles-setup.service ] || rm -f $i; done); \
rm -f /lib/systemd/system/multi-user.target.wants/*;\
rm -f /etc/systemd/system/*.wants/*;\
rm -f /lib/systemd/system/local-fs.target.wants/*; \
rm -f /lib/systemd/system/sockets.target.wants/*udev*; \
rm -f /lib/systemd/system/sockets.target.wants/*initctl*; \
rm -f /lib/systemd/system/basic.target.wants/*;\
rm -f /lib/systemd/system/anaconda.target.wants/*;
VOLUME [ "/sys/fs/cgroup" ]
 
RUN yum update -y 
RUN yum --setopt=tsflags='' -y install man man-pages man-db
RUN yum --setopt=tsflags='' -y install openssh openssh-server 
RUN yum --setopt=tsflags='' -y install openssh-clients sudo 
RUN yum --setopt=tsflags='' -y install initscripts
 
# Copy over keys (These keys must be in local host system and generated before hand)
COPY ssh_host_rsa_key /etc/ssh/ssh_host_rsa_key
RUN chmod 600 /etc/ssh/ssh_host_rsa_key
COPY ssh_host_ed25519_key /etc/ssh/ssh_host_ed25519_key
RUN chmod 600 /etc/ssh/ssh_host_ed25519_key
COPY ssh_host_ecdsa_key /etc/ssh/ssh_host_ecdsa_key
RUN chmod 600 /etc/ssh/ssh_host_ecdsa_key
 
RUN adduser User
RUN echo User:pass | chpasswd
RUN usermod -aG wheel User
 
EXPOSE 22
 
CMD ["/usr/sbin/init"]