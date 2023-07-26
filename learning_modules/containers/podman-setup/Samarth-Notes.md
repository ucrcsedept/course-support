## Accessing Containers using Podman - MacBook Pro macOS Ventura 13.2.1 

Prerequisite: Makes sure to have homebrew installed on your mac: https://brew.sh/

Step 1: Download Podman from this website: https://podman.io/

When you install and run this app, it should look like this: 

<p align="center">
  <img src="images\image1.png">
</p>

You can check if podman is installed by running this command in your terminal, which should give you the podman version that you installed: 

```
podman -v
```
Now, with homebrew installed, run this command within your terminal:

```
brew install podman-compose
```

Now when you run:
```
podman-compose
```

you should see options come up, which means it is correctly installed. 

Now, open VScode, and open up your course folder with the docker-compose.yml and the DockerFile.txt files: 

<p align="center">
  <img src="images\image5.png">
</p>

In order to containerize, you have to also download the VScode extension called dev containers, which you can find by typing "dev containers" in the four blocks icon in the top left, it should look like this: 

<p align="center">
  <img src="images\image3.png">
</p>

Now that you have installed this extension, go into settings, search for dev > Containers: Docker Path, and set that path to podman: 

<p align="center">
  <img src="images\image2.png">
</p>

Now go back to the VScode file, and within this VScode instance, open up the terminal within VScode, and now, making sure that you are in the right class folder where the DockerFile and the yml file is, run this command: 

```
podman-compose up -d
```

This should open up a new VScode instance that will allow you to code within the podman container! You can check to see if the containers are running by going to the podman app and checking your containers: 

<p align="center">
  <img src="images\image6.png">
</p>


















