FROM ros:jazzy-perception-noble

# Set up environment variables used during the build and
# when the container is run afterward.
ARG DEBIAN_FRONTEND=noninteractive
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
        # Reasonable text pager
        less \
        # Basic but good shell
        bash \
        # Utilities
        net-tools \
        curl \
        # CS 265A specific packages
        # The ROS desktop full package includes the Ignition version of Gazebo
        ros-jazzy-desktop-full \
        # More Python packages for the course
        python3-numpy \
        python3-pip \
        # XFCE4 window manager, needs dbus for components to communicate with each other
        xfce4 \
        xfce4-goodies \
        dbus-x11 \
        # Tigervnc for VNC _and_ X server
        tigervnc-standalone-server \
        tigervnc-tools \
        # Contains Xrandr
        x11-xserver-utils \
        # Provides http access to Xtigervnc in server
        novnc \
        websockify \
        python3 \
        python3-websockify \
        # To support sudo access
        sudo \
        # To start and manage services in container
        supervisor \
        tini \
    && \
    # Firefox!
    install -d -m 0755 /etc/apt/keyrings && \
    wget -q https://packages.mozilla.org/apt/repo-signing-key.gpg -O- | tee /etc/apt/keyrings/packages.mozilla.org.asc > /dev/null && \
    gpg -n -q --import --import-options import-show /etc/apt/keyrings/packages.mozilla.org.asc | awk '/pub/{getline; gsub(/^ +| +$/,""); if($0 == "35BAA0B33E9EB396F59CA838C0BA5CE6DC6315A3") print "\nThe key fingerprint matches ("$0").\n"; else print "\nVerification failed: the fingerprint ("$0") does not match the expected one.\n"}' && \
    echo "deb [signed-by=/etc/apt/keyrings/packages.mozilla.org.asc] https://packages.mozilla.org/apt mozilla main" | tee -a /etc/apt/sources.list.d/mozilla.list > /dev/null && \
    echo 'Package: *\nPin: origin packages.mozilla.org\nPin-Priority: 1000' | tee /etc/apt/preferences.d/mozilla && \
    apt-get remove -y firefox && apt-get update && apt-get install -y --no-install-recommends \
        libpci-dev \
        libcanberra-gtk3-module \
        libgles2-mesa-dev \
        dbus-x11 \
        firefox-esr && \
    # Clean up apt cache
    rm -rf /var/lib/apt/lists/*

# Supervisord runs services - web, VNC, and X session - as 'ubuntu' user
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
# The 'ubuntu' user is used in the container
RUN echo 'ubuntu ALL=(root) NOPASSWD: ALL' > /etc/sudoers.d/ubuntu
RUN echo 'source /opt/ros/jazzy/local_setup.sh' >> /home/ubuntu/.bashrc
RUN mkdir /workspace && ln -sf /workspace /home/ubuntu/workspace
# Expose the noVNC port
EXPOSE 6080
USER ubuntu
# Tini manages services, it's a tiny equivalent to init/systemd
ENTRYPOINT ["/usr/bin/tini", "--", "/entrypoint.sh"]
# Command to run when a container starts
CMD ["/usr/bin/supervisord", "-c", "/etc/supervisor/conf.d/supervisord.conf"]
