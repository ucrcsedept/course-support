# Working with Containers in VSCode

In this module, you will learn about containers, and how to work within them in VSCode. Containers are isolated environments used to develop, ship and run applications. The two containerization services we will be using are called Docker and Singularity, and we will be using them to package together all the software you need for a certain course.

## What is Docker?

Simply put, Docker is a containerization platform that is used to package applications into containers that can be run on *any* system. This is because Docker uses virtualization (not to be confused with virtual machines) to run the applications in the containers in an isolated, easily portable environment. Being able to package your applications in this manner is very important because it is impossible to replicate all the conditions that you have on your local machine on others.

## What is Singularity?

### Containers vs Virtual Machines

While containers are very similar to a VM in that they both allow you to run applications in isolation with all dependencies and required software, VMs require a whole OS, which means they are very slow and resource heavy. Containers are built from images, which can be thought of a lightweight version of an OS that has only the required processes and dependencies to run the application, making them much faster. Essentially, containers directly address the cons of using VMs, while also keeping their benefits.

<p align="center">
   <img src="images/docker-example.png">
</p>
<p align="center">
   Visual example of Docker, with the Docker Engine running as a layer between the OS kernel and the containerized applications (source: <a href="https://www.docker.com/resources/what-container/">Docker</a>)
</p>

## Why use containerization for courses?

Since containers are portable packages of software, they will be used to package all required software for a certain course, which allows for easy and convinent setup. It will trivialize the setup process between all classes that choose to use Docker to package their software in this manner, while also being quick and OS-independent. The only thing you need to do if you are doing this for the first time is install Docker (if you plan to run the container on your own computer instead of UCR servers). Every other time, you simply have to download the course's given `Dockerfile` and `docker-compose.yml` file, and run a few commands to get everything you need. 

Being able to use containers will also be important beyond the courses here at UCR. The use of containers across the world has been increasing among both personal users/developers and the industry. The popularity of containerization and Docker itself has been increasing. In 2020, [StackOverflow released their yearly developer survey](https://www.section.io/engineering-education/why-is-docker-so-popular/#The_popularity_of_Docker:~:text=The%20popularity%20of%20Docker), which shows just how fast Docker has been growing. With the service growing more popular, we want to incorporate it into our courses to give everyone more experience with containerization software, while also making it incredibly useful.

## Optional: What is a `Dockerfile` and a `docker-compose.yml` file?

### NOTES FOR THIS SECTION (IGNORE)

- Introduce Dockerhub, (base) images, layering
     - Have a basic "hello world" image example
- Need to do more research on `docker compose` command and the purpose of the `yml` file.
---

## Configuring Containers on UCR Servers (Recommended)

First, you need to SSH to school servers for your course. If you do not know how to, refer to [this video](https://www.youtube.com/watch?v=4wrQ-MFxO3Q) for an example. Open your home directory folder, which for CS-related majors should be `/home/csmajs/[your_ucr_netid]`, or for non-CS-related majors, should be `/class/classes/[your_ucr_netid]`. Next, download your course's corresponding `Dockerfile` and `docker-compose.yml` file from this repository (course-support repository isn't public, so no link yet), and add them to your home directory folder on the UCR servers by dragging and dropping them in. To organize your server space, put the two files into their own directory named after the course. 
### NOTES FOR THIS SECTION (IGNORE)

- Refer to SSH module/video to make sure students know how to SSH
- Getting the course-specific Dockerfile and docker-compose.yml file onto server into their own directory
- Introduce Singularity
    - Another containerization service like Docker. Used on CSE servers 
    - Why Singularity?
        - Unlike Docker, mounts to host file system (in this specific case, your home directory on servers) so you can use VSCode
        - Supports Docker images/containers
        - Security reasons: Docker requires root access, cannot be given on school servers for obvious reasons.
        - Containers can be run as executables.
- Use Singularity to run Docker containers
- *Note: After introducting Docker, it may be confusing to students to just drop Singularity on their heads like this. Maybe give more context as to why we are using Singularity?*

## Configuring Containers on Local Machine

### NOTES FOR THIS SECTION (IGNORE)

- Installing Docker Desktop on Windows/MacOS, or Docker Community for Linux machines
    - Windows - set up variables so you can use docker on command line
    - Linux - set up user verification so you don’t have to `sudo docker` every time.
- Installing Docker and Remote - Containers VSCode plugins to enable working on containers in VSCode
- Getting the course-specific Dockerfile and docker-compose.yml file onto server into their own directory
- Using Docker to build and run containers on local machine
    - Uses Remote - Containers plugins to work on containers using VSCode interface.

## Video Examples
- Using certain software within containers will be course specific, so it is important that students at least know how to access these containers. Make sure they know to refer to course specific documentation for tutorials on how to use whatever is in the container they configure.
    - Add an example. Use the existing dockerfiles that are in the current course-support repository.
    - Video example for both methods should and will be made.