# Introduction to GDB in VSCode

In this module, you will learn how to use the graphical version of the C++ debugger in VSCode, which runs on GDB (GNU Debugger).

## What is a Debugger?

A debugger gives you a closer look at your program, allowing you to look at exactly what it is doing while it executes line by line. It is a useful tool to diagnose what is happening in your program if the output is not what is expected, or if it crashes entirely.

## Setup

All you need to use the debugger built into VSCode is to install the C++ extension from the VSCode extension marketplace, which you should have done by now. (if not, refer to module 1).

## Using the Debugger

We will start with a simple single file example to introduce the features of the debugger. Create a new file called `main.cpp`, and paste the following contents in:

```cpp
#include <iostream>
using namespace std;

int main()
{
    int myArray[5];
    int* arrayPointer = myArray;
    cout << "Input 5 numbers: ";
    for (int i = 0; i < 5; i++)
    {
        cin >> *(arrayPointer + i);
    }
    cout << "Array contents: ";
    for (int i = 0; i < 5; i++)
    {
        cout << *(arrayPointer + i) << ' ';
    }
    cout << endl;
}
```

This program takes in 5 integer inputs from the user, and stores them into an array and outputs them.

### Setting Breakpoints

### Watching Variables/Arrays

### Step In vs Step Over

### Finding Crashes

In order to find out where our program crashes, lets change our `main.cpp` file so that it doesn't work. Change the line `int* arrayPointer = myArray` to `int* arrayPointer = nullptr`.

### Debugging with Multiple Files

The process for debugging with multiple linked source files requires some setup. By default, VSCode assumes that you are debugging only one file. In order to make it so the debugger recognizes that you have linked source files, we need to make a slight change. Notice that when you started the debugger, a new directory called `.vscode` was created within your directory. Open it, and you should see a file called `tasks.json`. This file is used by the debugger to pass in arguments to the debugger so you don't have to. We are interested in the block called `args`. You should see that there is a list of arguments in that block. They are telling the debugger where to look for the source files. Simply add whatever source files you want to debug as an argument in that block. If you want to debug all the source files in your directory, then replace the argument `"${file}"` with `"*.cpp"`.

## Examples of Common Errors using Pointers and Linked Lists

While it is a good skill to know how to use a debugger, it is still just a tool like a fancy text editor or a syntax highlighter. Technically, all you get out of a debugger is a deeper look at your program as you step through it line by line. It should not be used as a crutch, as it doesn't tell you anything other than the current variable values, memory locations, and where your program terminates. **To get legitimate value out of a debugger, you need to be able to trace your code and understand where the errors come from.** A debugger may be able to tell you the exact line your program came to a halt due to a segmentation fault, but that information doesn't mean anything if you don't know why your program would crash there. Being able to recognize patterns and common errors will allow you to get better use out of a debugger.

[Here](./main.cpp) is a small list of common errors made with pointers that your IDE won't bail you out of. While these errors are written in a way that it is obvious to spot what is wrong with each example, it is important to recognize that they exist and can be helpful in diagnosing what may be going wrong in your programs. The errors shown in that example may seem obvious now, but that is only because each error is presented in isolation; it is much harder to spot the exact error when looking at a file that is hundreds of lines long and these errors could potentially span across functions/scopes/files. Recognizing (no need to memorize, you'll run into them yourself eventually) the patterns here will help you find them down the line, and could save you countless hours of debugging.
