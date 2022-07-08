# Introduction to Visual Studio Code and C++

In this lab, we will be configuring and introducing the basics of Visual Studio Code, an IDE with many useful features from syntax highlighting to intelligent code completion.  Today, you will learn how to configure VSCode to work with C++, play around with some basic programs, and learn about some of the many useful features that VSCode has.

## What is an IDE?

An IDE, or an integrated development environment, is a piece of software that provides us with a multitude of different components in one user interface to maximize productivity. The most common features in an IDE are a code/text editor (usually with syntax highlighting), build automation (a compiler, version control like Git, or automated testing), and a debugger. While IDEs are not required (you have written and compiled code without one before), they provide the tools to create bigger projects, collaborate with others, and make development more convenient.

## Why VSCode?

VSCode is an incredibly popular IDE, and for good reason. We chose it for this class because it is very lightweight and widely supports most langauges and features that are considered essential for development. It also has a large marketplace of extensions that make it easy to extend and personalize your version of VSCode. This doesn't mean that VSCode is the **best** IDE out there; we encourage you to get experience with other IDEs if you wish/if your company requires you to use a different one.

## Part 1: Installation and Configuration

First, install the correct version of VSCode at [this link](https://code.visualstudio.com/download) for your operating system and processor. Once VSCode is installed, open it and install the C++ extension by going to the extension tabs on the taskbar on the left, searching for the C++ extension by Microsoft, and install it. This extension will allow for VSCode to provide syntax highlighting for C++ files to make source files easier to read, and also provides autocompletion.

<p align="center">
    <img src="images/installC.gif" alt="Installing C++ Extension">
</p>

Now, in order to configure VSCode to work with C++, we must install a C++ compiler. The compiler we will be using is G++, which is the C++ compiler from the GNU Compiler Collection (GCC). The way we install our compiler varies on which operating system we are using, so drop down the appropriate list and follow the instructions there.

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
<summary>Linux (Ubuntu)</summary>
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

## Part 2: Using the Compiler on the Command Line

Now that our compiler is installed, lets use it! Create a new folder on your desktop, and name it CS010B. Open it in VSCode by going to File > Open Folder (or by using the shortcut Ctrl + O or Cmd + O for macOS), and open the CS010B folder. Now, we have an empty folder open in VSCode. Now open a terminal in VSCode by going to Terminal > New Terminal (or by using the shortcut Ctrl + \` or Cmd + \` for macOS). Your terminal should show the path to the CS010B folder. To make sure, use the ```pwd``` command, and it should print the path to the CS010B folder. ```pwd``` stands for "print working directory", and it is a helpful command for keeping track of where your terminal is currently looking at. We can use our terminal to create a file in our folder by using the ```touch``` command. Lets create a file called ```main.cpp``` by running the command ```touch main.cpp```. Now, you should see an empty C++ file in your CS010B directory. Open it, and paste this code in.

```cpp
#include <iostream>
using namespace std;

int main() {
   cout << "Hello World!" << endl;
   return 0;
}
```

Make sure to save your file, and in the terminal, type the following command:

``` g++ -std=c++14 main.cpp ```

Let's break down what this command means. ```g++``` is the compiler that we are using. ```-std=c++14``` is something called a compiler flag, and compiler flags usually start with a ```-```. This compiler flag simply sets the compiler to compile to the C++14 standard. While the command will work without this flag, it is good to know how to switch standards. ```main.cpp``` is the target file that contains the code we want to compile.

> Note: The shell that we are using is called Bash. A useful feature of a lot of shells is that they support autocomplete. For example, you can type ```g++ m``` and press the Tab key, and it will autocomplete the name to ```main.cpp```. This will be useful for when you have longer file names.

If the compilation worked, you will see no output and a new file in your CS010B folder. If you are using Windows, it should be ```a.exe```, but if you're using Linux/macOS, it should be ```a.out```. In order to see all the files in the current directory in your terminal, you can print them using the ```ls``` (stands for "list") command. To run out new executable, run the command ```./a.exe``` (if you are on Windows) or ```./a.out``` (if you are on Linux/macOS). Once you execute the command, you should see "Hello World!" printed out into the terminal.

> Note: The ```.``` refers to the current directory. If you want to learn why we need to use ```./``` to run executables, then [this StackOverflow post](https://stackoverflow.com/questions/6331075/why-do-you-need-dot-slash-before-executable-or-script-name-to-run-it-in-bas) provides a good explanation.

By default, source files compiled by G++ are named ```a```, but usually we want to give our programs recognizable names. To do this, we can use the compiler flag ```-o```, which is a compiler flag that names the output executable. First, lets remove the old executable by doing ```rm a.exe``` or ```rm a.out```. Then, run the following command:

``` g++ -o hello_world main.cpp ```

> Note: Some of the most common compiler flags you will see are -g (enables debugging), -O2 or -O3 (optimization flags), and -Wall (enable all warnings).

This will compile ```main.cpp``` into an executable called ```hello_world```, and you can run it by running the command ```./hello_world``` in your console.

## Part 3: Features of VSCode

VSCode has many useful features that help increase your productivity. You will learn more about some of these features later (debugging, connecting to a remote server), but some of the features that will be useful to you right now are:

| ![](images/multiplecursor.gif) | ![](images/renamevariable.gif) |
| :--: | :--: |
| *Alt+ Left Click to add a cursor*| *Rename variables*|