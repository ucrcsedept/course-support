# Podman Notes

- This requires having a terminal open, and in order to do this, press the Windows Key, and type in "Terminal"
- At any time, you're also able to open a terminal in VS Code using the Terminal tab at the top and clicking `New Terminal`
- Terminologgy:
  - `sudo` allows you to run a command as the superuser (root)
  - `pacman` is Arch Linux's native package manager, has to be run with sudo
  - `yay` is one of Arch Linux's pacman wrappers that allows you to download from the AUR


## Arch

### Installation

**`sudo pacman -Sy`**
  - This command is running `pacman`, which is Arch's native package manager, as a superuser (root), the `-S` flag meaning synchronize, and the `y` meaning refresh, meaning you're refreshing and synchronizing all the packages from the main repository to your local device 
  - NOTE: You may want to restart your system because there's a possibility there was a kernel update from before

**`sudo pacman -S podman podman-compose git`**
  * This command is using `pacman` to install the packages `podman` `podman-compose` and `git`

**`podman system reset`**
- This command will completely reset `podman` and removes all pods, containers, images, networks, volumes, and machines
   
### Setup
- If you do not currently have VS code, install visual-studio-code-bin extension with a pacman wrapper such as **yay** that lets you build packages from community uploaded. You can find them [here](https://wiki.archlinux.org/title/AUR_helpers) under **pacman wrappers**
  * Example: **`yay -S visual-studio-code-bin`**
  * Issues that may occur with package managers is sometimes they involve the usage of Python, so if python is not installed (you can try running **`python3 -v`** and if it outputs a version you have it), you can run **`sudo pacman -S python`** or you can choose from the other versions [here](https://wiki.archlinux.org/title/python) and install with your pacman wrapper (e.g. **`yay -S python312`**)
- Install Dev Containers extension on VS Code by clicking the icon in VS Code: 

    ![Extensions Icon](images/VSCodeExtensions.png)
    
    And then search for "Dev Containers"
- Press F1 and type Settings and open Dev Container’s settings, and set Docker Path to **podman**, and Docker Compose Path to **podman-compose**
   ![Dev Container Settings](images/VSCodeDevContainer.png)
   ![Modified Settings](images/LinuxVSCodeModified.png)
- Install C/C++ extension on VS Code by clicking the icon in VS Code: 

    ![Extensions Icon](images/VSCodeExtensions.png)
    
    And then search for "C/C++"

### Issues

- Root or **`sudo`** is the only way to run Podman / Docker, leading to not see containers on VS Code as permission was denied.
    - How does one fix this?
        - According to [this](https://www.techrepublic.com/article/enable-podman-sudoless-container-management/) article, “Part of the reason for this is kernel namespaces and unique IDs and group IDs. Under normal circumstances, a user has access to around a thousand UIDs that will be assigned to various processes within a namespace. However, Podman uses a subordinate operating system that is assigned to the user who deployed the container. Because of that, your user needs considerably more UIDs and SUBUIDs than the default. So, not only do we have to increase the number of SUBUIDs and SUBGIDs, but we also have to allow those UIDs and GIDs within the user’s namespace and install a piece of software that will provide user-mode networking for unprivileged network namespaces.”
        
        ```bash
        sudo usermod --add-subuids 200000-265536 --add-subgids 200000-265536 $USER
        ```
        
        - After that, you need to check if the user has access to enough namespaces:
        
        ```bash
        sysctl --all --pattern user_namespaces
        ```
        
        - If this number is around 1000, follow these steps:
        
        ![ArchImage](images/ArchIncreaseGuid.png)
        
        - To install the user-mode networking software, run **`sudo pacman -S slirp4netns`**
        - Once that is done, reboot your system and you should be ready to use podman!
- On starting the container, if you get an issue like
    - fix: WARN[0000] aardvark-dns binary not found, container dns will not be enabled
        - In order to fix this, simply run **`sudo pacman -S aardvark-dns`**



## Ubuntu
### Installation
**`sudo apt-get update && sudo apt-get install podman podman-compose git`**
* This command will synchronize your system with the latest package information from the repositories defined in your system. There are by default repositories installed so you do not need to worry. After synchronization, it will then install `podman` `podman-compose` and `git`
### Setup
- Install Dev Containers extension on VS Code by clicking the icon in VS Code: 

    ![Extensions Icon](images/VSCodeExtensions.png)
    
    And then search for "Dev Containers"
- Press F1 and type Settings and open Dev Container’s settings, and set Docker Path to **podman**, and Docker Compose Path to **podman-compose**
   ![Dev Container Settings](images/VSCodeDevContainer.png)
   ![Modified Settings](images/LinuxVSCodeModified.png)
- Install C/C++ extension on VS Code by clicking the icon in VS Code: 

    ![Extensions Icon](images/VSCodeExtensions.png)
    
    And then search for "C/C++"


## Common Issues
* If there is an error when it comes to starting a container that does not make sense, there is a chance your disk space is low. 

## Commands
### Starting a directory that contains a docker-compose.yml and a Dockerfile
- In your terminal, **`podman-compose up -d`**
  - This command starts a new container with the name and image given in the docker compose file, then detaches it from the terminal into a background process

## Running a Hello World Program
- To start this process, reopen your terminal and type **`git clone https://github.com/ucrcsedept/course-support/`**
### Python
- In order to run a barebones python container, in your terminal type **`cd containers/cs009a`** which will change our current directory of the terminal into the CS009A course directory
- Run `podman-compose up -d` to start the container
- Click F1 and type Attach, and you will see the following show:
![Attach to container](images/VSCodeAttach.png)
- Click on it, and you should see the `cs009a_cs009a_1` container, and click on that, and it should open a new window
- At the top of the new window, click `Terminal` and then `New Terminal`, and it should open a terminal at the bottom
- From here, type `mkdir YouCanPutWhateverYouWantHere` and it will create a new directory depending on whatever you named it in the current directory you are in. 
- Then type `cd WhateverYouNamedYourFolder` but remember it is **case-sensitive**
- Now return to your workspace area, click `Open Folder`
![Open folder](images/VSCodeOpenFolder.png) and then click on the folder you created.
- From there, hover over the folder name in your hiearchy and click on the New File icon
![New file](images/VSCodeNewFile.png)
- Name this `main.py` and paste this code:
```py
if __name__ == "__main__":
    print("Hello world!")
```
- Ctrl + S to save this file, then return to your terminal and run the file by typing **`python3 main.py`**