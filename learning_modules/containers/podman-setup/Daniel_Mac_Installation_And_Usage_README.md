# Installing podman on Mac
Installing podman on Mac is simple using a package manager. For this tutorial, we'll be using Homebrew.

First, verify if Homebrew is installed on your device by opening a terminal window and typing in and entering this command:
>Note: You can open a terminal window by pressing the ⌘CMD + SPACE hotkey to open Spotlight Search, and searching for the "Terminal" application

```
brew --version
```

If Homebrew is installed, the command will print the version number of Homebrew that is installed. Otherwise, it will print an error message saying that the command is not found.  
If it is not installed, refer to the installation tutorial below. 

<details>
<summary>Installing Homebrew</summary>

1. First, visit the Homebrew [website](https://brew.sh).

2. On the homepage, there is a section that says "Install Homebrew" with a textbox below it. Click the clipboard button on the right to copy the script in the textbox:

<p align="center">
<img title="Homebrew Installation" alt="Homebrew Installation Script" src="images/HomebrewInstallationScript.png" width = "600" height = auto>
</p>

3. Open a terminal window and run the command.
4. This script installs Homebrew on your device, it will ask for your device's password and you will need to enter it to continue installation.
5. Finally, verify that Homebrew is installed by running `brew --version`

</details> <br />

Once Homebrew is installed, you can install podman by running `brew install podman` in the terminal.

## Installing podman-compose
#### Using Python/Conda
1. If Anaconda Python is installed on your device, you can install podman-compose using this command:
```
conda install -c conda-forge podman-compose
```
>Note: If Python is installed some other way, you can use either `pip` or `pip3` to install podman-compose.

#### Using Homebrew
1. podman-compose can be installed using Homebrew with the command: 

```
brew install podman-compose
```

Once podman-compose is installed, you can verify that it was successful by running `podman-compose --version`

## Running Your First Container
1. Now that Podman is installed, we can create our first container.
2. On Windows Devices and Macs, podman uses a virtual machine to create and run containers. You can initialize this machine by running:

```
podman machine init
podman machine start
``` 

This creates a podman machine with the default name `podman-machine-default`. Run `podman machine info` in the terminal to confirm that the machine was started.

3. To create a Hello World container, open a terminal window, and type in the command:

```
podman run --name hello-world-container hello-world
```

4. The `--name` flag sets the name of the created container to `hello-world-container`. `hello-world` is the name of the image that podman uses to create the container. Running the container gives this output:

<p align="center">
<img title="Hello World Container" alt="Podman Hello World Container" src="images/podmanHelloWorld.png" width = "400" height = auto>
</p>

5. To save space/resources, remove the container using `podman rm hello-world-container`

## Creating a container using Dockerfiles stored in a GitHub Repository
1. First clone the GitHub repository to your computer using `git clone REPOSITORY`. For this example, we'll be cloning the CSE [course-support repository](https://github.com/ucrcsedept/course-support.git).
>Note: Git is typically preinstaleld on Macs. You can verify that it is installed by running `git --version` in the terminal. if it is not installed, refer to the guide below.

<details>
<summary>Installing Git</summary>

1. If you don't have Git installed on your device, runnign `git --version` may have prompted you to install Git. In this scenario, simply follow along the instructions 

</details>

2. In the terminal, navigate to the repository using `cd DIRECTORY`. 
3. Navigate to the course directory you want to create a container for inside the `containers` folder. For this example, we'll use `cs100`.
4. Now that we're in the `cs100` folder (or whichever class you chose) we can use either `podman build` or `podman-compose` to build an image using the files located inside the current directory.
	<details>
	<summary>podman build</summary>

	Run the command:
	
	```
	podman build -t [name] .
	```
	
	The period at the end indicates that the build context is the current directory. This means that podman will create an image using the files in the directory it is currently in. You can now run the new container using: 
	
	```
	podman run [options] IMAGE
	```

	`IMAGE` is the name you set in the build command.
	>Note: The `--name` flag sets a name for the container. Otherwise, the container will have a randomly generated name.
	</details>

	<details>
	<summary>podman-compose</summary>

	Run the command:

	```
	podman-compose up -d
	```

	This command will build AND run the container using the files in the current directory. the `-d` flag indicates that the container will run in detached mode. This means that the current terminal window will not attach to the container, and instead the container will run in the background.
	</details>

5. You can verify the container is running using `podman ps`, which outputs a list of all currently running containers. If your container is in the list, you have successfully started your container. 

## Developing using VSCode in a container
1. Head to the extension tab and install the  "Dev Containers" extension in VSCode
2. Click on the gear icon on the Dev Containers store page and click on "Extension Settings" to go to the settings for Dev Containers
3. Once in the settings, scroll down to the `Dev > Containers: Docker Path` section and replace `docker` with `podman`:

<p align="center">
<img title="Docker Path" alt="Docker Path Setting" src="images/dockerPath.png" width = "550" height = auto>
</p>

Additionally, in the `Dev > Containers: Docker Compose Path` setting, replace `docker-compose` with `podman-compose`:

<p align="center">
<img title="Docker-Compose Path" alt="Docker-Compose Path Setting" src="images/dockerComposePath.png" width = "550" height = auto>
</p>

4. To attach to a running container, click on the button to the bottom right and click `Attach to Running Container...` and select to container you want to attach to:

<p align="center">
<img title="Attaching To Container" alt="Attach to running container" src="images/attachToContainer.png" width = "600" height = auto>
</p>

<p align="center">
<img title="Selecting Container" alt="Select Container from list" src="images/selectContainer.png" width = "600" height = auto>
</p>

Alternatively, You can also use the *Remote Explorer* tab on the left sidebar, and under the `Dev Containers` section, find the container you want to connect to, right click and select `Attach in Current Window` or `Attach in New Window`:

<p align="center">
<img title="Attaching using Remote Explorer" alt="Attach Using Remote Explorer" src="images/attachUsingRemoteExplorer.png" width = auto height = "325">
</p>

>Note: If the Remote Explorer tab isn't showing "Dev Containers", you may be in the "Remotes (Tunnels/SSH)" tab instead. Switch over by clicking the drop-down selection at the top to the right of "REMOTE EXPLORER" at the top of the sidebar and select "Dev Containers" 

<p align="center">
<img title="View Dev Containers" alt="Switch to viewing Dev Containers" src="images/viewDevContainers.png" width = "450" height = auto>
</p>

5. This connects VSCode to your container, allowing you to work inside of it.
6. To verify that the connection was successful, open a terminal and the user will look similar to `root@24aef0be3792:~#`. The characters after `root@` will be the ID of the container.

You have now successfully created and entered a container for your course in VSCode!


## Creating Your First C++ Program in a Container
1. Upon opening the container for the first time, VSCode will show a home page with no folder opened:

<p align="center">
<img title="Container Initial Screen" alt="Container Initial Screen" src="images/VSCodeContainerInitialScreen.png" width = "550" height = auto>
</p>

2. Click the "Open" button with a folder next to it located at the middle of the welcome screen. 
3. Clicking that will open a window to select a folder to open. The window will display the `/root/` directory. First. click the two dots `..` to move up to the parent directory. Then, locate the `home` file and open it. 

<p align="center">
<img title="Switch to Parent Directory" alt="Switch to Parent Directory" src="images/dotParentDirectory.png" width = "400" height = auto>
</p>

<p align="center">
<img title="Open Home Directory" alt="Open Home Directory" src="images/homeFolder.png" width = "400" height = auto>
</p>

4. Once you open the Home directory, the sidebar will display that you are in the home directory, which is currently empty.

<p align="center">
<img title="File Explorer view" alt="File Explorer View" src="images/sidebarView.png" width = "350" height = auto>
</p>

5. Click the leftmost button on the file editor bar to create a new file and name it `main.cpp`. 

<p align="center">
<img title="Create main.cpp" alt="Create main.cpp" src="images/createMain.png" width = "350" height = auto>
</p>

6. View the file, and copy and paste this code snippet into the file. 

```
#include <iostream>

using namespace std;

int main() {

    cout << "Hello world!" << endl;

    return 0;
}
```

7. Click the Terminal dropdown button in the menu bar and create a new terminal window. This will create a new terminal screen at the bottom of the VSCode window.

<p align="center">
<img title="Open New Terminal" alt="Open New Terminal" src="images/createNewTerminal.png" width = "525" height = auto>
</p>

8. In this terminal, enter the command `g++ main.cpp`. This command will compile your Hello World program and create a new file in the same directory named `a.out`.

9. In the terminal window again, type the command `./a.out`. This will run the program you just made, the only output should be `Hello World!`.

10. If you see that output in the terminal, you have successfully created a Hello World program within your container.