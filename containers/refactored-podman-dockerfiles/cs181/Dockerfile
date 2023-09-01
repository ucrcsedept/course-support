FROM --platform=linux/amd64 ubuntu:18.04

# Ubuntu 18.04 is the last version of Ubuntu to have tcl and tk 8.5 for ruby-tk.  

# Set up environment variables used during the build and
# when the container is run afterward.
ENV DEBIAN_FRONTEND=noninteractive
ENV LANG=C.UTF-8
ENV LC_ALL=C.UTF-8
ENV TZ="America/Los_Angeles"

# Set up time zone related info so later commands in build will work reliably
RUN ln -snf /usr/share/zoneinfo/America/Los_Angeles /etc/localtime && echo America/Los_Angeles > /etc/timezone

# Update software
RUN \
    apt-get -y update && apt-get -y upgrade \
    # Install packages needed for the class
    && apt-get install -y --no-install-recommends \
        # Basic software that should be available in all containers.
        # Configurable text editor
        vim \
        # C/C++ compilers, development libraries, and header files
        build-essential \
        # Git commands
        git \
        # Enables pulling files from a URL
        wget \
        # Allows multiple terminal "sessions" in one window
        tmux \
        
        # Software specific to CS 181
        apt -y install ruby-full tcl8.5-dev tk8.5-dev \ 
        gem install tk -- --with-tcltkversion=8.5 \
        --with-tcl-lib=/usr/lib/x86_64-linux-gnu \
        --with-tk-lib=/usr/lib/x86_64-linux-gnu \
        --with-tcl-include=/usr/include/tcl8.5 \
        --with-tk-include=/usr/include/tcl8.5 \
        --enable-pthread \ 

        # Racket
        apt -y install racket \ 

        # Standard ML of New Jersey
        apt -y install smlnj smlnj-doc \ 
      ; \
  # Clean up apt cache
  rm -rf /var/lib/apt/lists/*

# Command to run when a container starts
CMD ["sleep", "infinity"]
