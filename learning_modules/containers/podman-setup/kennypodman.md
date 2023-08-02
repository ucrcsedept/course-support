# Podman Installation -- macOS: Ventura 

If you fall into any of the following categories, we recommend using this method and work with Podman:

1. If you are simply curious about Podman and wish to explore it beyond the classroom setting.
2. If you prefer working on a local machine instead of a remote one.
3. If the remote method is not working as expected for you.

However, in all other cases, we advise you to utilize the pre-configured containers available on the UCR servers. This will lead to a smoother and more optimized experience for your specific needs.

## Prerequisites -- Xcode & Homebrew

Before proceeding with the installation of Podman, it is essential to confirm that certain prerequisites are met. We will first check for Xcode and Homebrew, and if necessary, install them before moving forward. This will ensure a smooth and successful installation process.

Navigate to your terminal, and run the following command
>Note: You can open the terminal by either pressing cmd + space and searching for "terminal" or by navigating to your launchpad and searching for "terminal."
```
xcode-select --version
```
If Xcode is already installed, your terminal will return the current version. Otherwise, you can follow the steps provided in the drop-down list below.
>A clear indication that it is not installed is when you encounter the following error message: **zsh: command not found: XCode-select**
<details>
<summary> <b>Xcode Installation</b></summary>
To install XCode, run the following command in your terminal
```
xcode-select --install
```

After running the command, a pop-up will appear. Choose the "Install" option and follw by clicking "Agree" to the license agreement. XCode will now begin installing. This may take a few minutes. Once the installation process is complete, simply click "Done" on the pop-up that confirms the software has been installed.

To check if the installation was successful, run the following command
```
xcode-select --version
```
The terminal should output the current version of Xcode.

</details>


The second requirement for Podman is Homebrew. To check if you have Homebrew installed on your system, enter the following command in your terminal
```
brew --version
``` 
If Homebrew is already installed, your terminal will return the current version. Otherwise, you can follow the steps provided in the drop-down list below.
>A clear indication that it is not installed is when you encounter the following error message: **zsh: command not found: brew**

<details>
<summary> <b>Homebrew Installation</b> </summary>

To begin the installation, navigate to the <a target="_blank" rel="noopener noreferrer" href="https://brew.sh/">Homebrew page</a>.

You will now see the following:

<p align="center">
   <img src="images/homebrew.png" alt="Homebrew Paste Icon" width = "850" height = "300"> 
</p>

To copy the script, simply click on the clipboard icon located to the right of the command, and then paste it directly into your terminal.

The terminal may prompt you for 'sudo access'. Enter the admin password to the terminal. You may not see the characters you are typing; this is normal.
>Note: Your admin password is the same password you use to log into your Mac.

After entering your password, a list will be displayed showing what is going to be installed and where. Press the **return** key on your keyboard to continue. The installation will now begin and may take a few minutes.

Once Homebrew has been installed, locate the following lines
```
==> Next steps:
- Run these two commands in your terminal to add Homebrew to your PATH:
    (echo; echo 'eval "$(/opt/homebrew/bin/brew/ shellenv)"') >> /Users/kennythai/.zprofile
    eval "$(/opt/homebrew/bin/brew shellenv)"
```
The two commands will vary slightly for every system. **DO NOT COPY** the commands from above, but instead the ones from your own terminal.

Copy and paste the first line into your terminal. In this case, the first line is **(echo; echo 'eval "$(/opt/homebrew/bin/brew/ shellenv)"') >> /Users/kennythai/.zprofile**

Copy and paste the second line into your terminal **eval "$(/opt/homebrew/bin/brew shellenv)"**

Once you have completed the previous steps, confirm the successful installation of Homebrew by running the following command.
```
brew --version
```
</details>

## Installing Podman

With our prerequisites completed, we can now proceed to install Podman. To get started, navigate to your terminal and execute the following command:
 
```
brew install podman
```

After the prior installation has finished, proceed to run this command:

```
brew install podman-compose
```

By following these steps, you will have successfully installed Podman and Podman Compose on your system. To double-check, execute the following two commands and check if they produce any output:

```
podman --version
podman-compose --version
```
## Container Tutorial

This section serves as a tutorial on how to create your first container, which is especially useful for those who are curious about Podman. Additionally, the knowledge gained here will be valuable in effectively managing your future containers for your courses.

Let's start by initializing our machine using the following commands:

```
podman machine init
podman machine start
```
>Note: This process could take a couple minutes. 

To confirm if the machine has been successfully started, execute the following command:

```
podman machine info
```

With the machine up and running, let's now create our first container! In this example, we'll create a "Hello World" container. Execute the following command:

```
podman run --name hello-world-container hello-world
```

Upon successful execution, you will see output similar to this:

<p align="center">
   <img src="images/hello_world.png" alt="Hello World Output" > 
</p>

To remove the container, simply run the following command:

```
podman rm hello-world-container
```
By following these steps, you will have initialized your machine, created and run your first container, and removed it when no longer needed.

## Creating a UCR-associated Container
For each course, there will be a distinct container that needs to be built.

Before proceeding, ensure you have cloned the <a target="_blank" rel="noopener noreferrer" href="https://github.com/ucrcsedept/course-support/tree/main ">UCR CSE Course Support repository</a> into your system.

Once you are in the main directory of the repository, navigate to the "containers" directory using cd containers, and then `cd` to the directory for your registered course. Execute the following command to build the container specifically for your class:

```
podman-compose up -d
```
>Note: This may take a few minutes.

To verify the successful creation of the container, execute the following command:
```
podman ps
```

## VSCode Dev Containers Extension

Open VSCode, and navigate to the **Extensions** tab on the left-hand side. Use the search bar to look for the **Dev Containers** extension and install it. 

<p align="center">
   <img src="images/ext.png" alt="VSCode Extensions" > 
</p>

Click on the VSCode gear icon located at the bottom left corner and select **Extensions**. For reference, please see the image below: 

<p align="center">
   <img src="images/settings.png" alt="Settings" > 
</p>

In the search bar (or use "cmd + f"), look for **Docker Path** and replace `docker` with `podman`.
<p align="center">
   <img src="images/dockerpath.png" alt="dockerpath" > 
</p>

Go to the search bar again and search for **Docker Compose Path** and replace `docker-compose` with `podman-compose`
<p align="center">
   <img src="images/dockerpath.png" alt="dockercompose" > 
</p>

Now that you have completed the initial setup, you can proceed with attaching a container to your current project.

Open your command pallete ("cmd + shift + p"), and search for `Attach to Running Container ...`. Click on it to initiate the process.

<p align="center">
   <img src="images/example.png" alt="example" width= " " height = " "> 
</p>

It will prompt you to open a new window, and once you do so, you will be developing within the attached container.

By following these steps, you will be all set to efficiently work with containers in your VSCode environment, tailored to your respective course's requirements. Happy coding!
## Potential Errors and Troubleshooting

### <u><b>Podman Machine and Container Errors</b></u>

This first part will include errors you may receive when starting your machine or container. If your error is unrelated to this and related to an issue in VSCode navigate [here](#vscode-extension-errors).

Here are some common errors you may encounter and the corresponding troubleshooting steps:
* <b>Error: failed to connect: dial tcp 127.0.0.1:53132: connect: connection refused</b>
* Stuck on <b>Waiting for VM ...</b>
* <b>Error: podman-machine-default: VM already exists</b>
* <b> Error: cannot start VM podman-machine-default: VM already running or starting </b>

To start, you can check if your machine is already running by using the following command:

```
podman machine info
```

Furthermore, you can determine which containers are currently in use with:

```
podman ps
```

These two commands will often help you identify the conflict as your machine and container is already running in the background. 

If you're still unable to identify the error, you can try the following commands to stop and remove the machine:

```
podman machine stop
podman machine rm
```

Afterward, restart the machine using:

```
podman machine init
podman machine start
```

Keep in mind that you may need to rebuild any containers that were lost during this process. You can find a reminder on how to do this [here](#creating-a-ucr-associated-container).

### <u><b>VSCode Extension Errors</u></b>