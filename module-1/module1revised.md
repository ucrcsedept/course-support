# Introduction to Visual Studio Code and C++

> Authors: Victor Hill and Joshua Candelaria (special thanks to Professor Neftali Watkinson and Professor Kris Miller)

Welcome to CS010B! In this lab, we will be configuring and introducing the basics of Visual Studio Code, an IDE with many useful features from syntax highlighting to intelligent code completion. In this introductory module, you will learn:

* How to install and configure VSCode for C++ programming
* How to compile with g++, a C++ compiler
* Basic use of VSCode with SSH

## What is an IDE?

An IDE, or an integrated development environment, is a piece of software that provides us with a multitude of different components in one user interface to maximize productivity. The most common features in an IDE are a code/text editor (usually with syntax highlighting), build automation (a compiler, version control like Git, or automated testing), and a debugger. While IDEs are not required (you have written and compiled code without one before), they provide the tools to create bigger projects, collaborate with others, and make development more convenient.

## Why VSCode?

VSCode is an incredibly popular IDE ([the most popular in the world, actually!](https://insights.stackoverflow.com/survey/2021)), and for good reason. We chose it for this class because it is very lightweight and widely supports most langauges and features that are considered essential for development. It also has a large marketplace of extensions that make it easy to extend and personalize your version of VSCode. This doesn't mean that VSCode is the **best** IDE out there; we encourage you to get experience with other IDEs if you wish/if you are ever required to use a different one. Here are some general questions that you should ask yourself for finding an IDE that suits your needs:

* Does the IDE support the programming languages I am going to use? (Bonus: is it recommended by the development community as a good option for those languages)
* Is it mature and well supported?
* Does it support collaboration and a direct connection to a respository?
* Does it support other technology I will use for my project? (connecting to servers, alternative testing frameworks, etc.)
* Does it have code autocomplete?
* Does it work with my operating system?
* Do I have to pay a license for it?
* Can I customize it however I want?

## Part 1: Installation and Configuration

First, install the correct version of VSCode at [this link](https://code.visualstudio.com/download) for your operating system and processor. Once VSCode is installed, we need to install an extension called Remote-SSH. This extension will allow you to work on UCR's servers remotely, saving your progress across devices and allowing you to use the software already installed on the server (like the compiler). To do this, open VSCode go to the extension tab on the left bar, and search for Remote-SSH. Make sure it is the extension that is published by Microsoft, verified with the blue check.

<p align="center">
    <img src="images/installremotessh.gif" alt="Installing Remote-SSH Extension">
</p>

Now, we can SSH into UCR servers! 