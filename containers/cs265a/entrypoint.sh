#!/bin/bash

# Set VNC password (non-interactive).  It can be set in the OS environment in the host
# by running a command like:
# export VNC_PW=mysecretpasswd
# or by sourcing a file with that information in it.
mkdir /home/ubuntu/.vnc
echo "$VNC_PW" | vncpasswd -f > /home/ubuntu/.vnc/passwd
chmod 0600 /home/ubuntu/.vnc/passwd
chown ubuntu. /home/ubuntu/.vnc/passwd
# This replaces the shell script process with the command in CMD (Supervisord)
# without changing the PID. Tini will now monitor Supervisord.
exec "$@"
