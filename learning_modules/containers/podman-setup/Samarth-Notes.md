## Accessing Containers using Podman - MacBook Pro macOS Ventura 13.2.1 

Prerequisite: Makes sure to have homebrew installed on your mac: https://brew.sh/

Step 1: Download Podman from this website: https://podman.io/

The website should look like this: 

<p align="center">
  <img src="images\image1.png">
</p>

Click on the "download" button, which should prompt you to either download a podman desktop version, or a podman CLI for macOS: 

<p align="center">
  <img src="images\image1.png">
</p>

Clicking on "Podman Desktop for macOS" should prompt you to download this file within your mac folder, as so: 

<p align="center">
  <img src="images\image1.png">
</p>

Click "Save". Now that it is downloaded, go into the "Finder" app, and locate this dmg file. Open the file, and move the app into your applications folder: 

<p align="center">
  <img src="images\image1.png">
</p>

Now you are able to use the podman desktop app! Now, find the app on your laptop, and click it. When you install and run this app, it should look like this: 

<p align="center">
  <img src="images\image1.png">
</p>

Now we can check to verify if podman is running on your computer. Navigate to the top right corner of your screen, where you should see a little magnifying glass that allows you to search for all apps: 

<p align="center">
  <img src="images\image1.png">
</p>

Click on that icon, which should give you a search bar, where you can type in "terminal": 

<p align="center">
  <img src="images\image1.png">
</p>

click on that black box that appears under the search, and that should open up a new terminal window, which should look something like this: 

<p align="center">
  <img src="images\image1.png">
</p>

> **_Quick_Tip:_** You can increase/decrease the font of the terminal by pressing command + at the same time or command - at the same time

You can check if podman is installed by running this command in your terminal (which just means typing the following command in terminal), which should give you the podman version that you installed: 

```
podman -v
```

This command should give you something like this: 

<p align="center">
  <img src="images\image1.png">
</p>









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


















