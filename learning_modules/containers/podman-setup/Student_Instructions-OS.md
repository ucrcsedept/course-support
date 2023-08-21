## Accessing Containers using Podman - MacBook Pro macOS Ventura 13.2.1 

### Part 1: Podman Installation and Verification

Step 1: Download Podman from this website: https://podman.io/

The website should look like this: 

</br>

<p align="center">
  <img src="images\macOS\image15.png">
</p>

</br>

Click on the "download" button, which should prompt you to either download a podman desktop version, or a podman CLI for macOS: 

</br>

<p align="center">
  <img src="images\macOS\image21.png">
</p>

</br>

Clicking on "Podman Desktop for macOS" should prompt you to download this file within your mac folder, as so: 

</br>

<p align="center">
  <img src="images\macOS\image2.png">
</p>

</br>

Click "Save". Now that it is downloaded, go into the "Finder" app, and locate this dmg file. Open the file, and move the app into your applications folder: 

</br>

<p align="center">
  <img src="images\macOS\image18.png">
</p>

</br>

Now you are able to use the podman desktop app! Now, find the app on your laptop, and click it. When you install and run this app, it should look like this: 

</br>

<p align="center">
  <img src="images\macOS\image13.png">
</p>

</br>

Now we can check to verify if podman is running on your computer. Navigate to the top right corner of your screen, where you should see a little magnifying glass that allows you to search for all apps: 

</br>

<p align="center">
  <img src="images\macOS\image9.png">
</p>

</br>

Click on that icon, which should give you a search bar, where you can type in "terminal": 

</br>

<p align="center">
  <img src="images\macOS\image3.png">
</p>

</br>

click on that black box that appears under the search, and that should open up a new terminal window, which should look something like this: 

</br>

<p align="center">
  <img src="images\macOS\image5.png">
</p>

> **_Quick_Tip:_** You can increase/decrease the font of the terminal by pressing command + at the same time or command - at the same time

You can check if podman is installed by running this command in your terminal (which just means typing the following command in terminal), which should give you the podman version that you installed: 

```
podman -v
```

This command should give you something like this: 

</br>

<p align="center">
  <img src="images\macOS\image20.png">
</p>

</br>

### Part 2: Podman-compose installation 

</br>

The first thing you need to install is HomeBrew, an installer for Apple. First, go to the homebrew website: https://brew.sh/ :

</br>

<p align="center">
  <img src="images\macOS\image1.png">
</p>

</br>

Now, copy that command under "Install Homebrew", either manually or by clicking that little clipboard icon on the left, and paste that command into terminal: 

</br>

<p align="center">
  <img src="images\macOS\image11.png">
</p>

</br>

<p align="center">
  <img src="images\macOS\image12.png">
</p>

</br>

It may ask you for your mac password, which you will have to enter to download it: 

</br>

<p align="center">
  <img src="images\macOS\image14.png">
</p>

</br>

It may take a while for HomeBrew to install, but once done, you should be able to type normally in the terminal again. To confirm that Homebrew was installed correctly, type this in the terminal: 

```
brew -v
```

Which should give you this message: 

</br>

<p align="center">
  <img src="images\macOS\image12.png">
</p>

</br>

Now, with homebrew installed, run this command within your terminal:

```
brew install podman-compose
```

Now when you run this in the terminal:
```
podman-compose -v
```

you should see something similar to this come up, which means it is correctly installed: 

</br>

<p align="center">
  <img src="images\macOS\image7.png">
</p>

</br>

Now, open VScode, and open up your course folder with the docker-compose.yml and the DockerFile.txt files: 

</br>

<p align="center">
  <img src="images\macOS\image6.png">
</p>

</br>

In order to containerize, you have to also download the VScode extension called dev containers, which you can find by typing "dev containers" in the four blocks icon in the top left, it should look like this: 

</br>

<p align="center">
  <img src="images\macOS\image8.png">
</p>

</br>

Now that you have installed this extension, go into settings, in the bottom left corner: 

</br>

<p align="center">
  <img src="images\macOS\image19.png">
</p>

</br>

Click on the settings button, and search for dev > Containers: Docker Compose Path, and set that path to podman-compose: 


</br>

<p align="center">
  <img src="images\macOS\image16.png">
</p>

</br>

Do the same by scrolling down to dev > Containers: Docker Path, and set that path to podman: 

</br>

<p align="center">
  <img src="images\macOS\image17.png">
</p>

</br>

Now go back to the VScode file, and within this VScode instance, open up the terminal within VScode like this: 

</br>

<p align="center">
  <img src="images\macOS\image4.png">
</p>

</br>

and now, making sure that you are in the right class folder where the DockerFile and the yml file is, run this command: 

```
podman-compose up -d
```

</br>

<p align="center">
  <img src="images\macOS\image22.png">
</p>

</br>

This should open up a new VScode instance that will allow you to code within the podman container! You can check to see if the containers are running by going to the podman app and checking your containers: 

</br>

<p align="center">
  <img src="images\macOS\image10.png">
</p>
