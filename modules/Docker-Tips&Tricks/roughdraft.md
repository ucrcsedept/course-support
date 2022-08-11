# **Docker: Tips and Tricks**

## Making changes to the Dockerfile, building it, but changes aren't appearing when composing?

* Make sure that you are building with a tag (-t) (otherwise the built image's name is "\<none>") and that the docker-compose.yml file "`image:`" line or command in terminal is referring to that tag/name
    * *Note: Delete \<none> tagged images too, you may have many of them*

---

## Using Linux in a Docker container and `docker compose down` taking forever?
* Try `sudo shutdown now` or some shut off command before exiting the terminal/ssh session.

---

## Can't access files from inside of a container?
* Try using a `bind mount` within the docker-compose.yml file (or as part of the command when running the image as a container). Bind mounts are folders that are mounted onto the container as if it is actually a folder in the virtual machine. Any action in the folder, on either side (host or client) will replicate to the other side.
* Observe:
<p align="center">
    <img src="images\dockerbindimage.png" alt="Docker Bind Folder Location">
</p>

```yml
version: '0.0'
services:
    main:
        image: some-image-to-become-container
        build: .
        hostname: me
        volumes:
            - type: bind
                source: ./bindable
                target: /home/me/cs183
```
* The result in the container:
<p align="center">
    <img src="images\dockerbindshowimage.png" alt="Docker Container View">
</p>

* Or use this flag when running the container: `--mount type=bind,source=./bindable,target=/home/me/cs183`
    * Example: `docker run -d -it --mount type=bind,source=./bindable,target=/home/Username/bound imageName`

---

## Is your Bind Mount folder causing a "stat ... input/output error" ?
* This is most likely due to your Docker Daemon requiring a restart
<details>
<summary>Windows Instructions to Restart</summary>

1. Close Docker Desktop Application
2. Open Task Manager
3. End "Docker Desktop Service" task first
4. End all other "Docker Desktop" tasks
5. Reopen Docker Desktop

</details>

---

## On Windows and "Vmmem" service/task taking a lot of memory/cpu on your machine?
* The "Vmmem" service is the windows Virtualization service. This is what is containing your containers. If you want it to shut off, that requires turning the Docker Daemon completely off.

---

## Changes in a previous session of a Docker container not showing up in the next?
* When you `docker compose down` or delete a container, all your changes are reset to what the original image's save was. If you want your changes like an update to persist, don't delete the container (or use compose down) and simply shutoff/restart the container. (Note: unsure how this affects Docker Daemon, and if you can shut Docker Daemon off without losing information)

---

## Can't access your docker container after build?
* Whether it's an issue because SSH isn't working or otherwise, you have two options:
    1. You can use `docker attach <container name>` to "attach" the current terminal session to the container as root user
    2. You can open the Docker Desktop application and open a terminal as root user in the container using the GUI Button present on the container row.

---

## Container exiting immediately on run/compose?
* There are two possibilities here:
    1. You are not remembering to use the `-d` flag when using the docker compose command `docker compose up -d` in order to detach the container from the terminal session and run the container in the background
    2. The main internal process of the container is ending. If this is the case, you can force the container to remain open by having the build of the image include:
    ```docker
    #If using ubuntu
    RUN apt -y install init
    CMD ["init"]
    ```
    * What this will do is install initialization processes onto the image (like systemd) which will then be run indefinitely when you run a container until you call a shutoff/shutdown command, allowing you to attach or ssh into your container.
        * *Note: don't forget to rebuild the image after adding those two commands at the end*