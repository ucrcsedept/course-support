# Setting up Docker in VSCode

In this module, we will be configuring Docker, a platform used to develop, ship, and run applications in isolated environments called containers, to work in Visual Studio Code. Docker containers will be used to package all software you need for a certain course into one container. 

## What is Docker?

Simply put, Docker is a containerization platform that is used to package applications into containers that can be run on *any* system. This is because Docker uses virtualization (not to be confused with virtual machines) to run the applications in the containers in an isolated, easily portable environment. Being able to package your applications in this manner is very important because it is impossible to replicate all the conditions that you have on your local machine on others.

### Containers vs Virtual Machines

While containers are very similar to a VM in that they both allow you to run applications in isolation with all dependencies and required software, VMs require a whole OS, which means they are very slow and resource heavy. Containers are built from images, which can be thought of a lightweight version of an OS that has only the required processes and dependencies to run the application, making them much faster. Essentially, containers directly address the cons of using VMs, while also keeping their benefits.

<p align="center">
   <img src="images/docker-example.png">
</p>
<p align="center">
   Visual example of Docker, with the Docker Engine running as a layer between the OS kernel and the containerized applications (source: <a href="https://www.docker.com/resources/what-container/">Docker</a>)
</p>

## Why use Docker for courses?

Since containers are portable packages of software, Docker will be used to package all required software for a certain course, which allows for easy and convinent setup. It will trivialize the setup process between all classes that choose to use Docker to package their software in this manner, while also being quick and OS-independent. The only thing you need to do if you are doing this for the first time is install Docker (if you plan to run the container on your own computer). Every other time, you simply have to download the course's given `Dockerfile` and `docker-compose.yml` file, and run a few commands to get everything you need. 

Being able to use containers will also be important beyond the courses here at UCR. The use of containers across the world has been increasing among both personal users/developers and the industry. The popularity of containerization and even just Docker itself has been increasing. In 2020, [StackOverflow released their yearly developer survey](https://www.section.io/engineering-education/why-is-docker-so-popular/#The_popularity_of_Docker:~:text=The%20popularity%20of%20Docker), which shows just how fast Docker has been growing. With the service growing more popular, we want to incorporate it into our courses to give everyone more experience with containerization software, while also making it incredibly useful.

## Optional: What are Dockerfiles?

---

## Configuring Containers on UCR Servers (Recommended)

- Refer to SSH module/video to make sure students know how to SSH
- Getting the course-specific Dockerfile and docker-compose.yml file onto server into their own directory
- Introduce Singularity
    - Why Singularity?
        - Mounts to host file system so you can use VSCode
        - Supports Docker images/containers

## Configuring Containers on Local Machine
- Installing Docker Desktop on Windows/MacOS, or Docker Community for Linux machines
    - Windows - set up variables so you can use docker on command line
    - Linux - set up user verification so you don’t have to `sudo docker` every time.
- Installing Docker and Remote - Containers VSCode plugins to enable working on containers in VSCode
- Getting the course-specific Dockerfile and docker-compose.yml file onto server into their own directory
- Using Docker to build and run containers on local machine
    - Uses Remote - Containers plugins to work on containers using VSCode interface.
- **Mileage may vary, make sure this is emphasized**
## Example
- Using certain software within containers will be course specific, so it is important that students at least know how to access these containers. Make sure they know to refer to course specific documentation for tutorials on how to use whatever is in the container they configure.
    - Possibly add an example. Use the existing dockerfiles that are in the current repository on local machine.