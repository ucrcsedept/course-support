# Working with Containers in VSCode

> Authors: Victor Hill and Joshua Candelaria

In this module, you will learn about containers, and how to work within them in VSCode. Containers are isolated environments used to develop, ship and run applications. The containerization service we will be using is called Docker, and we will be using it to package together all the software you need for a certain course.

## What is Containerization?

When software is being developed in a specific environment, deploying or transferring the code for that software may result in bugs and errors ("But it works on my machine!"). A common example of when this problem happens is when code is transferred between two different operating systems, or two different processor architectures (x86 vs ARM). This problem is directly addressed with something called containerization, which is when we package that same code with the necessary operating system libraries and dependencies into a small, lightweight exectuable called a container that can be run on any computer. Being able to package your applications in this manner is very important because it is impossible to replicate all the conditions that you have on your local machine on others. Containers use virtualization (not to be confused with VMs) to create these small, isolated development environments. 

### Containers vs Virtual Machines

While containers are very similar to a VM in that they both allow you to run applications on any machine in isolation with all dependencies and required software, VMs require a whole OS, which means they are very slow and resource heavy. Containers are built from images, which can be thought of as a lightweight version of an OS that has only the required processes and dependencies to run the application, making them much faster and take up less resources. Essentially, containers directly address the cons of using VMs, while also keeping their benefits.

### Why use containerization for courses?

Since containers are portable packages of software, they will be used to package all required software for a certain course. It will trivialize the setup process between all classes that choose to use containerization to package their software in this manner, while also being quick and OS-independent.

Being able to use containers will also be important beyond the courses here at UCR. The use of containers across the world has been increasing among both personal users/developers and the industry. The popularity of containerization and Docker itself has been increasing. [StackOverflow's 2020 Developer Survey](https://www.section.io/engineering-education/why-is-docker-so-popular/#The_popularity_of_Docker:~:text=The%20popularity%20of%20Docker) shows just how fast Docker has been growing. With the service growing more popular, we want to incorporate it into our courses to give everyone more experience with containerization software, while also making it incredibly useful.

---

## What is Docker?

Docker, as of the writing of this module, is by far the most popular containerization service. They have the largest image library, known as [Docker Hub](https://hub.docker.com/), where you can find the base image you need to start with. You can build upon a base image with something called a `Dockerfile` to install whatever dependencies you need to get your application to run (this is commonly referred to as adding layers to the base image). With this file, you can build the image, and whenever you need that isolated environment, you build the container using the image. If you plan to run your containers locally, we will go over this process more in depth later on in the module.

<p align="center">
   <img src="images/docker-example.png">
</p>
<p align="center">
   Visual example of Docker, with the Docker Engine running as a layer between the OS kernel and the containerized applications (source: <a href="https://www.docker.com/resources/what-container/">Docker</a>)
</p>

## Optional: What is a `Dockerfile` and a `docker-compose.yml` file?

### NOTES FOR THIS SECTION (IGNORE)

- Introduce Dockerhub, (base) images, layering
     - Have a basic "hello world" image example
- Need to do more research on `docker compose` command and the purpose of the `yml` file.
---

## Accessing Containers on UCR Servers in VSCode (Recommended)

First, you need to SSH to UCR servers for your course. If you do not know how to, refer to [this video](https://www.youtube.com/watch?v=4wrQ-MFxO3Q) for an example. Open your home directory folder, which for CS-related majors should be `/home/csmajs/[your_ucr_netid]`, or for non-CS-related majors, should be `/class/classes/[your_ucr_netid]`. Depending on which server you logged into, you should see an executable named after your course. For example, if you logged onto `cs100.cs.ucr.edu`, there should be an executable named `cs100` (no file extension) in your folder. That executable would be run by running the command `./cs100` into your terminal (Ctrl + \`). So, the command you would run to access the container for your course would be `./[course_name_here]`. This container already has all the required software for that course. All proper `Dockerfiles` and images have already been configured for your course, so all you need to do is run the executable script! 

## Accessing Containers on Local Machine

> Note: The setup for this method takes considerably longer than using UCR servers. Also, note that virtualization must be enabled on your machine for this to work (usually enabled by default on most machines).

In order to access the containers for courses on local machines, you will first need to install Docker.

<details>
<summary>Windows</summary>

> Note: Docker's hardware and software requirements are a lot more strict than other common software. Check [here](https://docs.docker.com/desktop/install/windows-install/) to make sure your machine will work with Docker.

1. First, install [Docker Desktop](https://www.docker.com/products/docker-desktop/) here for your appropriate OS and processor. 

2. Open a Powershell terminal as admin by going to the start menu, right clicking, and click Run as Administrator.

3. Run these commands within the Powershell terminal:

```
dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart
dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart
```

4. Download the Linux kernel update package [here](https://docs.microsoft.com/pl-pl/windows/wsl/install-manual#step-4---download-the-linux-kernel-update-package).

5. Run this command in your Powershell. 

```
wsl --set-default-version 2
```

Now, Docker should be fully working on your computer. To test this, open up a command prompt and type this command:

```
docker run --name hello-world-container hello-world
```

The output should be something like:
```
Hello from Docker!
This message shows that your installation appears to be working correctly.

To generate this message, Docker took the following steps:
 1. The Docker client contacted the Docker daemon.
 2. The Docker daemon pulled the "hello-world" image from the Docker Hub.
    (amd64)
 3. The Docker daemon created a new container from that image which runs the
    executable that produces the output you are currently reading.
 4. The Docker daemon streamed that output to the Docker client, which sent it
    to your terminal.

To try something more ambitious, you can run an Ubuntu container with:
 $ docker run -it ubuntu bash

Share images, automate workflows, and more with a free Docker ID:
 https://hub.docker.com/

For more examples and ideas, visit:
 https://docs.docker.com/get-started/
```

To save space/resources, remove the container.
```
docker rm hello-world-container
```

</details>

<details>
<summary>MacOS</summary>

</details>

<details>
<summary>Linux</summary>

</details>

Now that Docker is set up, open VSCode and install two extensions: "Docker" and "Remote - Containers". Both should be verified by Microsoft. Now, create a folder for the course you are taking that is using containers. In this folder, you need to add a `Dockerfile` and a `docker-compose.yml` file. Those two files should have been given to you by an instructor, otherwise, they can be found [here]() at this repository.

### NOTES FOR THIS SECTION (IGNORE)

- Installing Docker Desktop on Windows/MacOS, or Docker Community for Linux machines
    - Linux - set up user verification so you don’t have to `sudo docker` every time.
- Installing Docker and Remote - Containers VSCode plugins to enable working on containers in VSCode
- Getting the course-specific Dockerfile and docker-compose.yml file onto server into their own directory
- Using Docker to build and run containers on local machine
    - Uses Remote - Containers plugins to work on containers using VSCode interface.

## Video Examples
### NOTES FOR THIS SECTION (IGNORE)

- Using certain software within containers will be course specific, so it is important that students at least know how to access these containers. Make sure they know to refer to course specific documentation for tutorials on how to use whatever is in the container they configure.
    - Add an example. Use the existing dockerfiles that are in the current course-support repository.
    - Video example for both methods should and will be made.