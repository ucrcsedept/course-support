# Introduction to SSH & Working on UCR's Servers

In this second VSCode module, you will learn:

* How to use Secure Shell (SSH) to connect to a remote server (both through command line and through VSCode)
* How to navigate a Linux operating system using the command line
* How to setup and work on a remote server

## Connecting to the CS010B Server

**NOTE FOR SELF: The actual server hasn't been set up yet, so once it is, update the actual commands used.**

For this class (and many future ones), a remote server will be used to host all labs. You will learn how to connect to a server using SSH by two methods, the command line, and through VSCode.

### Command Line

VSCode and other graphical interfaces won't be accessible all the time, so it is good to learn how to SSH into a remote server using just the terminal in case you ever need to. The method of SSH varies with operating system, so select whichever operating system you are on. Before we proceed, make sure that you have a CS account. If you **don't have one/aren't sure if you have one**, [go to this link](https://systems.engr.ucr.edu/createaccount) to set one up. If you **forgot your password**, then [go here](https://systems.engr.ucr.edu/policies/password).

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

Type "yes". You will be prompted to enter your CS password. As a security measure, no characters will be echoed into the console as you type your password. Once you have sucessfully logged in, you should be able to see that your terminal's user has changed to [your CS username] @ the server **NOTE: change "the server" to what they will actually see once the server is set up**. You have sucessfully SSH'd into the UCR servers through the command line!

In order to terminate the SSH connection, use the `exit` command. **PLEASE DON'T FORGET TO DO THIS WHENEVER YOU ARE DONE!** Closing out of the terminal without using the `exit` doesn't log you out on the server, which consumes precious server resources.

> Note: You are NOT required to do every (or any) assignment on the remote servers, in fact we encourage you to do all the assignments in your own personal development environment. The reason we want to show you this method is that future classes will require you to use the servers in order to access the material (**and will assume you can do it**), so we are making sure you are familiar with the process now.

## Navigating the Linux File System

Navigating through the Linux file system will be a bit different because we don't have a graphical interface, we only have the terminal. However, the file system itself isn't too different from other file systems you may be familiar with. A helpful way to visualize the file system is to view it as a tree: a tree starts at the root. In this case, it would be the root directory which is denoted as `/` in Linux and usually as `C:\` in Windows. Within these root directories there are many files and directories that live within that root directory called children, and those children have children. We will go over several commands that you use to traverse the file system through the command line.

> Note: Even though we are only using command line without VSCode here, it is still important to understand how to navigate a file system with the terminal even if you have a graphical interface! One example is for knowing which files to compile and how to correctly navigate to them so you can tell the compiler where to look.

|![Tree of Linux File System](images/linuxfilesystem.png)|
|:--:|
| *A visual example of the Linux file system* |

Whenever you log into any of the school servers, you should be placed into your user root directory/home directory. In order to see the current directory you are in, use the `pwd` command (print working directory). The path printed should be `/home/csmajs/[your CS username]`. If not, use the `cd ~` command, where `cd` is the command to "change directory" and `~` is an alias that represents your personal home directory.

Now, lets use the file system. Type the following command:

``` mkdir example_dir ```

The `mkdir` command stands for "make directory". Since your current path was your home directory, this means your new directory was created here. To make sure, run the `ls` command (stands for "list"). Let's change into that new directory with `cd example_dir`. Our path now should be `/home/csmajs/[your CS username]/example_dir`. Type `pwd` just to make sure that this is your path, since we changed to the `example_dir` directory. Now, lets go back to the home directory. Type `cd ..` The `..` is an alias that represent the previous directory/the current directory's parent. (similary, as mentioned in module 1, a single period `.` represents the current directory). These aliases (`.`, `..`, and `~`) make it much easier to move through the file system without typing the full path and names of directories.

Now try typing the whole path.

```cd /home/csmajs/<your_CS_username>/example_dir```

Check that we are in `example_dir` with `pwd` again, but this time we typed the whole path instead of just `cd example_dir`. This is because, in the first case, we used a *relative* path, since we were changing directories relative to our current directory. The path we used this time was an *absolute* path, since we started with the root directory `/`. Paths that start with the root directory `/` are always absolute, otherwise they are relative.

Go back to your home directory (you should know how to do this by now). Another command we will cover is `rm`. Now that we know how to traverse the file system, lets delete our example directory. Make sure you're home (`pwd`) and type this command:

``` rm -rf example_dir ```

`rm` stands for "remove". If we were removing a normal file, we wouldn't need these flags, but because this is a directory, we need the `-rf` flags. `-r` means to remove files recursively (this means it deletes all files and directories within that directory), and `-f` disables user confirmation for each deletion.

> Note: `rm -rf` is crazy powerful. You can essentially break your whole system with `rm -rf /` (don't do this, you have been warned). So, be very careful when you use this command, as there is no undoing these deletions (notice there isn't any recycle bin).

To prepare for the next part, lets make some directories and some files. We are going to create two directories called `src` and `header`, and put a `.cpp` file in each. Run these commands:

```
mkdir module2
cd module2
mkdir src
mkdir header
cd src
touch main.cpp
touch person.cpp
cd ../header
touch person.h
```

The `touch` command simply creates a file with that name.

As a summary, these are the commands we went over (feel free to use this as a cheatsheet until you get used to navigating file systems via the command line):

* `mkdir` creates a directory.
* `cd` changes your directory to the directory passed in by a path.
    * `cd ..` goes back one directory
* `ls` lists all files in your current directory
* `pwd` prints the current working directory's path
* `rm` deletes a file
    * `rm -rf` removes a directory, and all files within it
* `touch` creates a file

> Note: Bash has a built in manual that shows you how to use a command and all the possible flags for it. You can use the `man` command (stands for manual), and do something like `man cd` in order to see the instructions for the `cd` command. You can also use the `--help` flag for most commands.

## SSH with VSCode

Now, we won't make you edit files using the command line, so we're gonna switch gears to using SSH with VSCode. `exit` out of the SSH of the command line, close your terminal and open VSCode. Go to the extension marketplace, and search for Remote-SSH (the one published by Microsoft, with the blue ribbon verification). Install it. Now, we can SSH using VSCode! To set up to connect to CS010B servers, follow these steps:

1. Open the command palette (F1), and type "Remote-SSH". Select the "Remote-SSH: Connect to Host" option.
2. Click add a new host, and type the following command:

    ``` ssh [your_cs_username]@cs10b.cs.ucr.edu ```

3. Once you connect, another instance of VSCode will open, and ask you for your password.
4. Since we are connected to a remote server, we have to configure our extensions again. Go to the extensions marketplace, and install the C++ extension.

Now, you have a fully configured workspace on VSCode while connected to school servers!

## Working on a Remote Server

Open a folder using Ctrl+O / Cmd+O. This should default to your home directory (the one using your cs username). Once you open it, you should see the directories and files you made earlier. In each of the following files, paste the following code in.

`src/main.cpp`

```cpp
#include <iostream>
#include <string>
#include "../header/example.h"
using namespace std;

int main()
{
    Person myPerson = Person("Bob");
    myPerson.printName();
    return 0;
}
```

`header/person.h`

```cpp
#ifndef PERSON_H
#define PERSON_H

class Person
{
    public:
        Person();
        Person(string name);
        void printName();
    private:
        string name;
        void assignName(string name);
};

#endif
```

`src/person.cpp`

```cpp
#include "../header/example.h"

Person::Person()
{
    name = "";
}
Person::Person(string name)
{
    this->name = name;
}
void Person::printName()
{
    cout << name << endl;
}
void Person::assignName(string name)
{
    this->name = name;
}
```
