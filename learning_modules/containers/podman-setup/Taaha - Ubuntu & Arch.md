# Podman Notes

## Arch

`**sudo pacman -Syu**`

`**sudo pacman -S podman**`

`**podman system reset**`

- Install visual-studio-code-bin extension with a package manager such as yay that lets you build packages from community uploaded
- Install Dev Containers extension on VS Code
- Press F1 and type Settings and open Dev Container’s settings, and set Docker Path to podman
- Install C/C++ Extension Pack on VS Code

### Issues

- Root or **`sudo`** is the only way to run Podman / Docker, leading to not see containers on VS Code as permission was denied.
    - How does one fix this?
        - According to [this](https://www.techrepublic.com/article/enable-podman-sudoless-container-management/) article, “Part of the reason for this is kernel namespaces and unique IDs and group IDs. Under normal circumstances, a user has access to around a thousand UIDs that will be assigned to various processes within a namespace. However, Podman uses a subordinate operating system that is assigned to the user who deployed the container. Because of that, your user needs considerably more UIDs and SUBUIDs than the default. So, not only do we have to increase the number of SUBUIDs and SUBGIDs, but we also have to allow those UIDs and GIDs within the user’s namespace and install a piece of software that will provide user-mode networking for unprivileged network namespaces.”
        
        ```jsx
        sudo usermod --add-subuids 200000-265536 --add-subgids 200000-265536 $USER
        ```
        
        - After that, you need to check if the user has access to enough namespaces:
        
        ```jsx
        sysctl --all --pattern user_namespaces
        ```
        
        - If this number is around 1000, follow these steps:
        
        ![Untitled](Untitled.png)
        
        - To install the user-mode networking software, run **`sudo pacman -S slirp4netns`**
        - Once that is done, reboot your system and you should be ready to use podman!
        - [https://github.com/cs100/lab-03---debugging-with-gdb-and-valgrind-msaye007-efox015-1](https://github.com/cs100/lab-03---debugging-with-gdb-and-valgrind-msaye007-efox015-1)
- On starting the container, if you get an issue like
    - fix: WARN[0000] aardvark-dns binary not found, container dns will not be enabled
        - In order to fix this, simply run **`sudo pacman -S aardvark-dns`**

---

## Ubuntu

**`sudo apt-get update && sudo apt-get install podman podman-compose`**

- Install visual-studio-code-bin extension with a package manager such as yay that lets you build packages from community uploaded
- Install Dev Containers extension on VS Code
- Press F1 and type Settings and open Dev Container’s settings, and set Docker Path to podman
- Install C/C++ Extension Pack on VS Code

---

rm -rf $HOME/docker-container && podman-compose down -v && podman-compose build && podman-compose up -d --force-recreate

podman-compose down -v && podman-compose build && podman-compose up -d --force-recreate
