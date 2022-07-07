# Introduction to Visual Studio Code and C++

In this lab, we will be configuring and introducing the basics of Visual Studio Code, a highly customizable development environment with many useful features from syntax highlighting to intelligent code completion. Due to its convenience and customizability, it is the most popular development environment in the world. Today, you will learn how to configure VSCode to work with C++, play around with some basic programs, and learn about some of the many useful features that VSCode has.

## Part 1: Installation and Configuration

First, install the correct version of VSCode at [this link](https://code.visualstudio.com/download) for your operating system and processor. Once VSCode is installed, open it and install the C++ extension by going to the extension tabs on the taskbar on the left, searching for the C++ extension by Microsoft, and install it.

<p align="center">
    <img src="images/installC.gif" alt="Installing C++ Extension">
</p>

Now, in order to configure VSCode to work with C++, we must install a C++ compiler. The way we install our compiler varies on which operating system we are using, so drop down the appropriate list and follow the instructions there.

[comment]: # (Maybe add a way to check processor type if the student is unsure which version to install?)

<details>
<summary>Windows 11/Windows 10</summary>
On Windows, we will be installing MinGW so that we can compile our C++ programs using the <code>g++</code> command. <br>
1. Download the MinGW Installation Manager Setup Tool at <a href="https://sourceforge.net/projects/mingw/">this link</a>. <br>
2. Run the setup executable. <strong>Copy your installation directory path, you will need this later!</strong> By default, it should be <code>C:\MinGW</code>, but if it is something else or you want to change it somewhere else, copy that instead. This is very important, as we need to <strong>paste the path to the MinGW folder somewhere else later</strong>. <br>
3. Open the MinGW Installation Manager after it is done setting up. You should see multiple packages, but we only need 4 of them: <br>
<pre>
mingw-developer-toolkit
mingw32-base
mingw32-gcc-g++
msys-base
</pre>
Right-click each package, and click "Mark for installation". Then, in the top left corner, click Installation > Apply Changes.
<p align="center">
    <img src="images/installgcc.gif" alt="Installing MinGW Packages">
</p>
4. Go to the Start Menu and search for "Edit the system environment variables". You should see a menu that looks like this.
<p align="center">
    <img src="images/environmentvariables.png" alt="Environment Variables in Control Panel" height=35% width=35%>
</p>
Now, under the system variables tab, look for the variable "Path". Click on it, then click "Edit". Click "New", then paste in the MinGW folder path you copied in step 2 (if you forgot to do this, then look for where you installed the folder and copy the path). At the end of the path, add <code>\bin</code> so that your path looks like this:
<pre>
C:\MinGW\bin
</pre>
If you installed MinGW in some other directory/folder, then it will look something like this:
<pre>
[path where you installed MinGW]\MinGW\bin
</pre>
<p align="center">
    <img src="images/environmentvariable.gif" alt="Adding Environment Variable to PATH in Windows">
</p>
5. The compiler should be fully installed by now. To make sure, go back to VSCode. At the top, click "Terminal > New Terminal". This opens a new terminal at the bottom of your screen. Run the following command in the terminal:
<pre>
g++ --version
</pre>
If everything works, then your output should look something like this, confirming that G++ is working properly:
<pre>
g++.exe (MinGW.org GCC Build-2) 9.2.0
Copyright (C) 2019 Free Software Foundation, Inc.
This is free software; see the source for copying conditions.  
There is NO warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
</pre>
Now, you have G++ installed and configured! You might be wondering why we had to do all this. We can think of the "Path" variable in Windows as assigning executables a name, just like a variable in C++, or a desktop shortcut for an executable. The reason we do this is because whenever we want to compile our programs, we can just use the <code>g++</code> command in our terminal, rather than going to the directory, passing in the file, and running the executable manually every time we want to compile.
</details>

<details>
<summary>Linux</summary>
1. Run the following commands on your terminal (open with Ctrl+Shift+T), which will install the G++ compiler for C++ and add it to your path variables automatically:
<pre>
sudo apt update
sudo apt install build-essential
</pre>
2. Verify that G++ is installed properly by running this command:
<pre>
g++ --version
</pre>
The output should look something like this if G++ was installed properly:
<pre>
g++ (Ubuntu 9.4.0-1ubuntu1~20.04.1) 9.4.0
Copyright (C) 2019 Free Software Foundation, Inc.
This is free software; see the source for copying conditions.
There is NO warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
</pre>
</details>

<details>
<summary>MacOS</summary>
</details>

## Part 2: Using the Compiler
