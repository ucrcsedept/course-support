# Working with Containers in VSCode

> Authors: Victor Hill and Joshua Candelaria

In this module, you will learn about containers, and how to work within them in VSCode. Containers are isolated environments used to develop, ship and run applications. The containerization service we will be using is called Docker, and we will be using it to package together all the software you need for a certain course.

If you would like more info/context on what containers and Docker is, then click [here](DockerInfo.md) to read more about those topics.

---

## Accessing Containers

There are two methods that you can use set up and build your course containers: either using the images that are on the UCR servers, or building them yourself with the given files on your own machine. We recommend using the UCR servers, since everything is already configured for you on the servers. If you prefer a local setup, that method can found [here](../../docker/docker-setup/README.md).

## Accessing Containers on UCR Servers via SSH (Recommended)

First, you need to SSH to UCR servers for your course. If you do not know how to, refer to <a target="_blank" rel="noopener noreferrer" href="https://www.youtube.com/watch?v=4wrQ-MFxO3Q">this video</a> for an example (replace CS010B with name of your course). There will be a script that will configure your image and container when you run it. **The script can be run using an environment variable that has the same name as the course**. For example, if you logged into `cs100.cs.ucr.edu`, you would run the command `cs100`, and you will automatically be placed into your CS100 container. For any course that uses a container, the environment variable is just the name of the course.

All proper `Dockerfiles` and images have already been configured for your course, so all you need to do is run the executable script!

A video example of accessing containers in VSCode via SSH can be seen here:

[![Example video for accessing a contanier through SSH](https://img.youtube.com/vi/0-LYQPDhM7c/maxresdefault.jpg)](https://www.youtube.com/watch?v=0-LYQPDhM7c)

If you would rather access your containers locally, click [here](../../docker/docker-setup/dockersetup.md) for a tutorial on how to configure Docker on your local machine.
