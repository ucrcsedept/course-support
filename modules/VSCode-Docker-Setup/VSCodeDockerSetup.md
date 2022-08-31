# Setting up Docker in VSCode

## What is Docker?
- First explain what images and containers are
    - A template for creating a container that can be built upon with layers (image)
        - ***Is there a better way to explain this?***
    - A lightweight, standalone, executable package of software that includes everything needed to run an application (containers) (taken from Docker website)
    - A set of instructions used to create a docker image (Dockerfile)
    - Pros of a VM without their cons
    - ***Note: Since this is moreso about configuration of Docker and a tutorial about how to use given images/Dockerfiles, should we go over how to create Dockerfiles?***
    - ***How in depth should this context be?***
## Why Docker?

- “Why use Docker for courses?”
    - A convenient way to get all software needed for a given course, allowing for easy setup
    - Experience with docker and containerization, something that is extraordinarily popular (hyperlink to some statistic that backs this claim up)
    - Since containers work on any machine, removes the complexity of setup

## Configuring Containers on UCR Servers (Recommended)

- Installing “Remote - Containers” and “Docker” extension on CS servers to enable working on containers in VSCode
    - Refer to SSH module/video to make sure students know how to SSH
- Getting the course-specific Dockerfile and docker-compose.yml file onto server into their own directory
    - Run `docker build -t course-name-image`
- Run the container using the “Remote - Containers” extension so that you can work in containers using the VSCode interface.
    - Use a **gif** to demonstrate this

## Configuring Containers on Local Machine
- Installing Docker Desktop on Windows/MacOS, or Docker Community for Linux machines
    - Windows - set up variables so you can use docker on command line
    - Linux - set up user verification so you don’t have to `sudo docker` every time.
- Rest of the instructions are same as above
- **Mileage may vary, make sure this is emphasized**
## Example
- Using certain software within containers will be course specific, so it is important that students at least know how to access these containers. Make sure they know to refer to course specific documentation for tutorials on how to use whatever is in the container they configure.
    - Possibly add an example. Use the existing dockerfiles that are in the current repository on local machine.