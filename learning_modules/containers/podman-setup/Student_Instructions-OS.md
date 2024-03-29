## Podman Installation -- macOS Ventura 13.2.1 
This tutorial will walk you through the steps to install Podman and Podmam-Compose.  You will use Podman and Podman-Compose for container management.

If you fall into any of the following categories, we recommend working with Podman:

1. If you are simply curious about Podman and wish to explore it beyond the classroom setting.
2. If you prefer working on a local machine instead of a remote one.
3. If the remote method is not working as expected for you.
4. If your course instructor has directed you to use Podman.

We advise you to utilize the pre-configured containers available on the UCR servers. This will lead to a smoother and more optimized experience for your specific needs.


### Podman Installation and Verification

On Mac, each Podman machine is backed by a QEMU based virtual machine. To create and start a virtual machine, you must install Podman.  

Download Podman from this website: https://podman.io/

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

Click on the black box that appears under the search. This will open up a new terminal window, which should look something like this: 

</br>

<p align="center">
  <img src="images\macOS\image5.png">
</p>

> **_Quick_Tip:_** You can increase/decrease the font of the terminal by pressing command + at the same time or command - at the same time

You can check if podman is installed by running this command in your terminal (which just means typing the following command in terminal). 
```
podman -v
```

This command will display the podman version that you have installed. This output should be something like this: 

</br>

<p align="center">
  <img src="images\macOS\image20.png">
</p>

Once installed, the podman command can be run directly from the Unix shell in Terminal, where it remotely communicates with the podman service running in the Machine VM.
</br>

### Podman-compose installation 

</br>
Podman containers are used for running applications in an isolated environment. It's quite common nowadays to see application deployments done in Podman for the numerous benefits it brings. However, it's often not as simple as just running a single container. Usually you may have many containers coming together to act as one cohesive service made up of many moving parts. Managing all of these at deployment time is messy, so to clean it up, Podman provides Podman Compose, a configuration tool used for running multiple containers at once. You can define all of the configuration in one YAML file, and then start all the containers with one command. 

You will need to install Podman-compose to run your container.

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

To verify that Podman-compose was installed correctly, you should see something similar to this come up: 

</br>

<p align="center">
  <img src="images\macOS\image7.png">
</p>

</br>

Congratulations!  You've successfully set up Podman and Podman Compose.
