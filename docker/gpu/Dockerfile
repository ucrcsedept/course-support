FROM nvidia/cuda:11.8.0-cudnn8-devel-ubuntu22.04

# Set up environment variables used during the build and
# when the container is run afterward.
ENV DEBIAN_FRONTEND=noninteractive
ENV LANG=C.UTF-8
ENV LC_ALL=C.UTF-8
ENV TZ="America/Los_Angeles"
ENV PATH="/opt/conda/bin:${PATH}"

# Update software
RUN apt -y update && apt -y upgrade

# Basic software that should be available in all containers.
RUN apt -y install vim build-essential git wget tmux

RUN wget --quiet https://repo.anaconda.com/archive/Anaconda3-2021.11-Linux-x86_64.sh -O ~/anaconda.sh && \
  /bin/bash ~/anaconda.sh -b -p /opt/conda && \
  rm ~/anaconda.sh && \
  ln -s /opt/conda/etc/profile.d/conda.sh /etc/profile.d/conda.sh && \
  echo ". /opt/conda/etc/profile.d/conda.sh" >> ~/.bashrc && \
  find /opt/conda/ -follow -type f -name '*.a' -delete && \
  find /opt/conda/ -follow -type f -name '*.js.map' -delete && \
  /opt/conda/bin/conda clean -afy

# Install Pytorch based on given command on Pytorch website
# https://pytorch.org/
RUN conda install pytorch torchvision torchaudio pytorch-cuda=11.7 -c pytorch -c nvidia

# Install Tensorflow based on Anaconda documentation
# https://docs.anaconda.com/anaconda/user-guide/tasks/tensorflow/
RUN conda create -n tf-gpu tensorflow-gpu \
    conda activate tf-gpu \
    conda create -n tf-gpu-cuda8 tensorflow-gpu cudatoolkit=9.0 \
    conda activate tf-gpu-cuda8

# Command to run when a container starts
CMD ["sleep", "infinity"]
