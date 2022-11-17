FROM ubuntu:22.04

# Set up environment variables used during the build and
# when the container is run afterward.
ENV DEBIAN_FRONTEND=noninteractive
ENV LANG=C.UTF-8
ENV LC_ALL=C.UTF-8
ENV TZ="America/Los_Angeles"
ENV PATH="/opt/conda/bin:${PATH}"

# Environment Variable for Java
ENV JAVA_HOME="/lib/jvm/java-11-openjdk-amd64/bin/java"

# Update software
RUN apt -y update && apt -y upgrade

# Basic software that should be available in all containers.
RUN apt -y install vim build-essential git wget tmux

# C++ DEV TOOLS
RUN apt -y install valgrind doxygen cmake bison flex libboost-all-dev

# RUST DEV TOOLS
RUN curl https://sh.rustup.rs -sSf | bash -s -- -y\
RUN echo 'source $HOME/.cargo/env' >> $HOME/.bashrc

# JAVA DEV TOOLS
RUN apt -y install default-jre

# C# DEV TOOLS
# Installed using Mono
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF \
    echo "deb https://download.mono-project.com/repo/ubuntu stable-focal main" | sudo tee /etc/apt/sources.list.d/mono-official-stable.list \
    apt install mono-complete -y

# RUBY DEV TOOLS
RUN apt -y install ruby-full

# PERL DEV TOOLS
RUN apt -y install perl

# GOLANG DEV TOOLS
RUN apt -y install golang-go

# ML DEV TOOLS
RUN apt-get -y install libpolyml9

# HASKELL DEV TOOLS
RUN apt -y install haskell-platform

# ERLANG DEV TOOLS
RUN apt -y install erlang

# PYTHON DEV TOOLS
# Same setup as CS105, CS171 and CS234 for now. Python containers should be able to run on JupyterHub.
RUN apt -y install python3-dev python3-pip
RUN wget --quiet https://repo.anaconda.com/archive/Anaconda3-2021.11-Linux-x86_64.sh -O ~/anaconda.sh && \
  /bin/bash ~/anaconda.sh -b -p /opt/conda && \
  rm ~/anaconda.sh && \
  ln -s /opt/conda/etc/profile.d/conda.sh /etc/profile.d/conda.sh && \
  echo ". /opt/conda/etc/profile.d/conda.sh" >> ~/.bashrc && \
  find /opt/conda/ -follow -type f -name '*.a' -delete && \
  find /opt/conda/ -follow -type f -name '*.js.map' -delete && \
  /opt/conda/bin/conda clean -afy

# Command to run when a container starts
CMD ["sleep", "infinity"]

