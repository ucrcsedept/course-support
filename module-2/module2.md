# Introduction to SSH & Working on UCR's Servers

In this second VSCode module, you will learn:

* How to use Secure Shell (SSH) to connect to a remote server (both through command line and through VSCode)
* How to navigate a Linux operating system using the command line
* How to setup and work on a remote server

## Connecting to the CS010B Server

**NOTE FOR SELF: The actual server hasn't been set up yet, so once it is, update the actual commands used.**

For this class (and many future ones), a remote server will be used to host all labs. You will learn how to connect to a server using SSH by two methods, the command line, and through VSCode.

### Command Line

VSCode and other graphical interfaces won't be accessible all the time, so it is good to learn how to SSH into a remote server using just the terminal in case you ever need to. The method of SSH varies with operating system, so select whichever operating system you are on. Before we proceed, make sure that you have a CS account. If you don't have one/aren't sure if you have one, [go to this link](https://systems.engr.ucr.edu/createaccount) to set one up.

<details>
<summary>Windows 10 or newer</summary>
Windows doesn't have SSH enabled by default, so before we can run it from the command prompt/Powershell (whichever you prefer), we need to enable OpenSSH.

1. Go to the Start Menu and search for "Add an Optional Feature"
2. Click "Add a feature"
3. Search for OpenSSH Server and install
![Installing OpenSSH on Windows](images/openssh.gif)

Now, open a command prompt (search "CMD" in the start menu) or a PowerShell terminal (search "PowerShell" in the start menu) and test whether or not this worked by running the following command:

``` ssh [your_cs_username]@cs10b.cs.ucr.edu ```

If you are having difficulty with this method, use the method outlined in "Older Versions of Windows".
</details>

<details>
<summary>Older Versions of Windows</summary>

In order to use SSH, you will have to install a program called [PuTTY](https://www.putty.org/). When you open PuTTY, there will be a box for a "Host Name", where you will input `[your_cs_username]@cs10b.cs.ucr.edu`. You can also use [Cygwin](cygwin.com) or [Windows Subsystem for Linux (WSL)](https://docs.microsoft.com/en-us/windows/wsl/about) instead if you wish; these applications emulate a Linux environment in Windows.
</details>

<details>
<summary>Linux or MacOS</summary>
Run the following command in your terminal:
<pre>ssh [your_cs_username]@cs10b.cs.ucr.edu</pre>
Replace [your_cs_username] with the username provided to you by the CS department.
</details>

If you have successfully established an SSH connection with the server, you should see an output like this:

```
The authenticity of host 'cs10b.cs.ucr.edu (xxx.xxx.xx.xx)' can't be established.
ECDSA key fingerprint is SHA256:TASH&SAHw89h2389hASUIdl.
Are you sure you want to continue connecting (yes/no/[fingerprint])? 
```

> Note: This prompt appears every time you SSH into a server for the first time, so don't let it scare you! This happens because whenever you SSH into a server, there is a list of known hosts saved on your computer. Since you have (presumably) never SSH'ed into this server, then you will get this message only the first time since the address of the server will then be added to the list of known hosts.

Type "yes". You will be prompted to enter your CS password. As a security measure, no characters will be echoed into the console as you type your password. Once you have sucessfully logged in, you should be able to see that your terminal's user has changed to your CS username @ the server **NOTE: change "the server" to what they will actually see once the server is set up**. You have sucessfully SSH'd into the UCR servers through the command line!

In order to terminate the SSH connection, use the `exit` command. **PLEASE DON'T FORGET TO DO THIS WHENEVER YOU ARE DONE!** Closing out of the terminal without using the `exit` doesn't log you out on the server, which consumes precious server resources.

## Navigating the Linux File System

Going through the file system will be a bit different because we don't have a graphical interface.

## SSH with VSCode

## Working on a Remote Server 

Multi-file example goes here
