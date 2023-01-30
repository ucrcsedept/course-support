# Introduction to Visual Studio Code and C++

> Authors: Victor Hill and Joshua Candelaria (special thanks to Neftali Watkinson and Kris Miller)

In this module, we will be configuring and introducing the basics of Visual Studio Code, an IDE with many useful features from syntax highlighting to intelligent code completion. In this introductory module, you will learn:

* How to install and configure VSCode for C++ programming
* How to compile with g++, a C++ compiler
* Basic use of VSCode with SSH

**IMPORTANT**: Before we proceed, make sure that you have a CS account. If you **don't have one/aren't sure if you have one**, <a target="_blank" rel="noopener noreferrer" href="https://sites.google.com/a/ucr.edu/cse-instructional-support/home/accounts#h.r2x4rti8gpg9">go to this link</a> to set one up. The same site will help if you **forgot your password and need to reset it**.

If you would like to learn more about VSCode, click [here](VSCodeInfo.md) to read about VSCode and why we're using it here at UCR.

## Part 1: Installation and Configuration

First, install the correct version of VSCode at <a target="_blank" rel="noopener noreferrer" href="https://code.visualstudio.com/download">this link</a> for your operating system and processor. Once VSCode is installed, we need to install an extension called Remote-SSH. This extension will allow you to work on UCR's servers remotely, saving your progress across devices and allowing you to use the software already installed on the server (like the compiler). To do this, open VSCode and go to the extension tab on the left bar, and search for Remote-SSH. Make sure it is the extension that is published by Microsoft, verified with the blue check.

<p align="center">
    <img src="images/installremotessh.gif" alt="Installing Remote-SSH Extension">
</p>

Now, we can SSH into UCR servers! To set up a connection to class servers, follow these steps:

1. Click the Remote-SSH symbol in the bottom left corner that looks like this: ![Remote SSH Symbol](images/remotesshsymbol.png) 

> Note: If you have a theme installed, the symbol may be a different color!

2. Click "Connect to Host", then click "Add new SSH host", and type the following command. Note that your CS username is the same as your UCR NetID.

    ``` ssh [YOUR UCR NETID HERE]@[COURSE NAME HERE].cs.ucr.edu ```

> Note: You must include the leading '0' if SSH'ing into a lower division course server. For example, to SSH into CS010B or CS010C, you must use [UCR NET ID]@cs010c.ucr.edu.

For example, the command would look something like `ssh jbieb001@cs010b.cs.ucr.edu`.

**Recommended:** When prompted to select the SSH configuration to edit, we recommend to select the option that starts with `C:\Users` if you are on Windows, and if you are on Mac, pick the one that starts with `/Users/`, and if you are on Linux, select the one that starts with `/home/`. This keeps your SSH configuration in your user space.

3. Click the Remote-SSH symbol ![Remote SSH Symbol](images/remotesshsymbol.png) again, then click "Connect to Host". You should see `[COURSE NAME HERE].cs.ucr.edu` is a saved host. Click on `[COURSE NAME HERE].cs.ucr.edu`, and a new instance of VSCode will open. Use this new instance from now on, the other may be closed. You will be prompted with "`[COURSE NAME HERE].cs.ucr.edu` has fingerprint" followed a very long string. Click Continue.

4. You will see a prompt asking you to "Select the platform of the remote host `[COURSE NAME HERE].cs.ucr.edu`". If you are, select **Linux**, **regardless of your operating system.** This is because the UCR servers run on a Linux distribution. If you do not see this prompt, do not worry, you can skip this step.

5. You will now be prompted to log in with your CS password (this may be different from your UCR password). Now that you're connected, go to the extensions marketplace and install the C++ extension. It should look like this:

<p align="center">
    <img src="images/cppextension.png" alt="C++ Extension">
</p>

**Do not skip step 5**. Some students skip this step because they have the C/C++ extension installed *locally*, but you must install the extension on the server as well.

> Note: If you are having trouble logging in, <a target="_blank" rel="noopener noreferrer" href="https://sites.google.com/a/ucr.edu/cse-instructional-support/home/accounts#h.r2x4rti8gpg9">go to this link</a> to reset your CS password.

Now, you have a fully configured workspace on VSCode while connected to school servers!

In order to close the connection, click the bottom left corner (it will say `SSH: [COURSE NAME HERE].cs.ucr.edu`). It will pull up the command palette, and to exit, press "Close remote connection". **PLEASE DON'T FORGET TO DO THIS WHENEVER YOU ARE DONE!** Closing out of VSCode without manually closing the connection doesn't log you out on the server, which consumes precious server resources.

To reconnect, click the Remote-SSH symbol ![Remote SSH Symbol](images/remotesshsymbol.png) in the bottom left corner, click "Connect to Host", then click the host you wish to connect to, and log back in. 

If you are having trouble, click on the picture below for a video example:

[![Example video for connecting to CS010B servers via Remote-SSH](https://img.youtube.com/vi/YtYMn4cmBE0/maxresdefault.jpg)](https://www.youtube.com/watch?v=YtYMn4cmBE0)

