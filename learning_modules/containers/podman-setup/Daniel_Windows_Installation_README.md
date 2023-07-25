# Installing Podman on Windows
1. First, visit the Podman releases page on Podman's [GitHub](https://github.com/containers/podman/releases).
2. Under the most recent stable release of Podman (indicated by the green "Latest" tag next to its name), scroll down to the "Assets" section

<p align="center">
<img title="Podman GitHub" alt="Podman GitHub" src="images/podmanReleaseGitHub.png">
</p>

3. Under the Assets tab, download the setup.exe file and run it.

<p align="center">
<img title="Podman Win10 Installation" alt="Podman Win10 Installation" src="images/podmanInstallerDownload.png">
</p>

4. The Podman installer has a checkbox to install the Windows Subsystem for Linux (WSL). Installing this is necessary to use Podman, so ensure the box is checked.

<p align="center">
<img title="Podman Win10 Installation" alt="Podman Win10 Installation" src="images/podmanInstallationWindows.png">
</p>

5. Click the install button to begin the installation process. 

>Note: If you are installing WSL, your computer may restart during the installation process

6. To verify that podman was successfully installed, open a command prompt window and enter `podman --version`

[//]: # (Podman usage is essentially the same as in Mac, so the instructions for that are in the Mac readme file)
