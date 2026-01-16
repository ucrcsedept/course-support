## CS 265A Container


### Overview

This directory provides all of the files related to running a container for CS 265A that has the software needed by the course installed in it.  The primary features are that:
- The container is cross platform. It can be run on Mac, Windows, and Linux using either Podman (recommended) or Docker Desktop.
- The recommended ways to access the container are:
  - In a web browser, to access GUI applications like Gazebo.
  - Using Visual Studio Code to connect to the running container, to edit and run code.
- The container is non-persistent. Any changes made to it while it is running will disappear when it is run again.
  - Because of this, files and code that you want to keep should be saved in the `/workspace` directory in the container, since that directory is actually stored on the computer running the container.

### Topics

The rest of this document covers:
1. How to install Podman and Podman-Compose on different operating systems, so that you can run the container.
2. How to build and run the container.
3. How to access the container from a web browser.
4. How to access the container from Visual Studio Code.
5. Troubleshooting tips if you encounter issues.
6. How to obtain help with the container if the troubleshooting tips do not resolve the issue.

__Note__: If you are already using Docker and have Docker Compose installed, you do not need to install Podman.  You can use Docker instead of Podman, as they are highly compatible. Please skip down to the section `Build and run the container` and start there. Replace `podman` with `docker` in the instructions, and they should work the same way.

#### Installing Podman and Podman Compose on Linux

Podman is available for most Linux distributions, and can be installed using the commands found here:

https://podman-desktop.io/docs/compose

Podman Compose is available as a package on most distributions, and can be installed as a Python package on others.

- Arch:
`sudo pacman -S podman-compose`
- Debian/Ubuntu:
`sudo apt install podman-compose`
- CentOS Stream/Fedora/Red Hat/Rocky:
`sudo dnf install podman-compose`

If you cannot install Podman Compose by other means, it is available as a Python 3 package:

`pip3 install podman-compose`

If you do thi, you may see a message that `podman-compose` is not in the default PATH, something like:
 ```WARNING: The script podman-compose is installed in '/home/myuser/.local/bin' which is not on PATH.```
If you see this, edit the init file for your shell, and add that directory to the PATH.  For example, if you are using `/bin/bash` as your shell, you would edit `~/.bashrc` and add this line at the end:
`export PATH=${PATH}:/home/MYUSER/.local/bin`, replacing `MYUSER` with your actual username.  Then you can open a new terminal and use podman compose in that terminal.

#### Installing Podman and Podman Compose on a Mac

We recommend installing Podman via the Brew package manager.

First, install Brew following the instructions on the following site:
https://brew.sh/

Next, run the following commands in a terminal to install Podman and Podman Compose:

```
brew install podman
brew install podman-compose
```

After doing so, you need to initialize a Podman machine and start it, by running these commands in a terminal:
```
podman machine init
podman machine start
```

The output should look similar to this once completed:

<img width="1139" height="651" alt="image" src="https://github.com/user-attachments/assets/c7a42326-cfe3-4fdb-b8bd-52faf8c29a83" />


#### Installing Podman and Podman Compose on Windows

Follow the instructions on this page:
https://github.com/ucrcsedept/course-support/blob/main/learning_modules/containers/podman-setup/Student_Instructions-Windows11.md

### Build and run the container

The files needed to build and run the container are in a Git repository. The steps needed are:

1. Go to https://github.com/ucrcsedept/course-support, and either clone or download that repository, depending on what your instructor recommends.  Make sure they are somewhere other than your "Downloads" directory.
2. Open a terminal and navigate to the following folder in the downloaded files:
  `containers/cs265a`
3. In the terminal, run the following command to build the container:
`podman compose build`
The build should take some minutes depending on your network connection speed and how fast your computer is.  It should complete without errors.
4. Start the container by running the following commmand in a terminal:
`podman compose up`

Optional: if you want to run the container with a different password to access it from a web browser, you can set the VNC_PW environment variable in your shell before running `podman compose up`.  Here is an example of how to do so in most common shells like zsh or bash:
`export VNC_PW=x3Se9U3B`

### Access the Container From a Web Browser

This works the same in Linux, macOS and Windows 11.

Once the container is running, you should be able to go to http://127.0.0.1:6080/vnc.html?resize=remote in a browser and see a "noVNC" site with the option to "Connect".

Click on "Connect" and enter your password. The default will be 'password' with no single quotes, unless you have set it to be something different per the optional part of the section above.

Once you do so, you should see a full Linux graphical desktop in your browser.  You can run applications there as you would on a normal desktop.  Some details:
- Save any files you want to keep in `/workspace`. All other files will go away when the container is exited! `/workspace` corresponds to the `workspace` folder in the directory you ran `podman compose up` in.
- Don't log out of the container. There's no need to do so.

### Access the container from Visual Studio Code

This works the same in Linux, macOS, and Windows 11.

(Note on a prerequisite): If you have not already done so, download Visual Studio Code from their website, and install it:
https://code.visualstudio.com/download

<img width="927" height="319" alt="image" src="https://github.com/user-attachments/assets/6aee47aa-a2ed-484d-aad0-4da9945abc99" />


First, run Visual Studio Code, and install the Dev Containers extension from https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers

Dev Containers will allow you to connect to a running container.  If you have followed the instructions so far, your container will already be running Podman and be able to be connected to:

To attach to your running Podman container, select `Dev Containers: Attach to Running Container...` from the Command Palette (F1). You should see a list of running containers.  If you are only using Podman for this course, then the only running container should have `cs265a` in the name.  You may see a warning message about security and trust, click through to continue.

<img width="1106" height="393" alt="Visual_Studio_Code01" src="https://github.com/user-attachments/assets/916d54cc-f9de-40dd-9e59-40d21c2dcbc6" />

<img width="285" height="327" alt="image" src="https://github.com/user-attachments/assets/2e29bd02-2fb3-408a-96c4-5feff1d64536" />



In the container:
- Save any files you want to keep in `/workspace`. All other files will go away when the container is exited! `/workspace` corresponds to the `workspace` folder in the directory you ran `podman compose up` in.

### Troubleshooting Tips

This section comvers errors you may receive when starting your machine or container.

Here are some common errors you may encounter and the corresponding troubleshooting steps:
* <b>Error: failed to connect: dial tcp 127.0.0.1:53132: connect: connection refused</b>
* Stuck on <b>Waiting for VM ...</b>
* <b>Error: podman-machine-default: VM already exists</b>
* <b> Error: cannot start VM podman-machine-default: VM already running or starting </b>

To start, you can check if your machine is already running by using the following command:
`podman machine info`

If it is not running, start it with:
`podman machine start`

Furthermore, you can determine which containers are currently in use with:
`podman ps`

These two commands will often help you identify the conflict as your machine and container is already running in the background.

If you are still unable to identify the error, you can try the following commands to stop and remove the machine:

```
podman machine stop
podman machine rm
```

Afterward, restart the machine using:

```
podman machine init
podman machine start
```

Keep in mind that you may need to rebuild any containers that were lost during this process.  Remember: do not store any files in the container itself, ony in the `/workspace` directory, which is actually stored on your computer.

### How to obtain help

Your TA and instructor can assist with issues related to your code and assignments.  For errors related to the container, please follow the troubleshooting steps above first. If those do not work, please send email to the CSE IT staff - systems [at] cs.ucr.edu, and please CC your instructor when you do so.  When you do so, clearly describe the issue and provide a screenshot for troubleshooting purposes.
