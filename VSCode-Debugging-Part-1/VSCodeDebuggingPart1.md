# Debugging Tutorial Part 1

> Authors: Victor Hill and Joshua Candelaria (special thanks to Professor Neftali Watkinson and Professor Kris Miller)

Now that you know about pointers and how problematic they can be, we will be going over a useful tool that will help you catch your mistakes.Today, you will learn:

* What a debugger is
* Basic use of a debugger using breakpoints and watching variables
* Common mistakes with pointers

## What is a Debugger?

A debugger gives you a closer look at your program, allowing you to look at exactly what it is doing while it executes line by line. It is a useful tool to diagnose what is happening in your program if the output is not what is expected, or if it crashes entirely. In this tutorial, we will be using the built in debugger in VSCode.

## Setup

All you need to use the debugger built into VSCode is to install the C++ extension from the VSCode extension marketplace.

## Using the Debugger

We will start with a simple example to introduce the features of the debugger. Create a new file called `main.cpp`, and paste the following contents in:

```cpp
#include <iostream>
using namespace std;

void myFunction(int* arrayPointer)
{
    cout << "Currently in display function!" << endl;
    for (int i = 0; i < 5; i++)
    {
        cout << *(arrayPointer + i) << ' ';
    }
    cout << endl;
}

int main()
{
    cout << "Starting program..." << endl;
    int myArray[5];
    int* arrayPointer = myArray;
    int input;
    cout << "Input 5 numbers: ";
    for (int i = 0; i < 5; i++)
    {
        cin >> input; 
        *(arrayPointer + i) = input;
    }
    cout << "Entering function..." << endl;
    myFunction(arrayPointer);
    cout << "Ending program..." << endl;
}
```

This program takes in 5 integer inputs from the user, and stores them into an array and outputs them.

### Setting Breakpoints

A breakpoint in a debugger is a point where we tell the program to pause, so we can look at what exactly is going on at that point of the program. In order to set a breakpoint, hover your cursor next to the line numbers. You should notice a small translucent red dot pop up; clicking it will set a breakpoint at that line of code.

<p align="center">
   <img src="images/breakpoint.gif" alt="Setting Breakpoint">
</p>

Set a break point at line 16 (which is `cout << "Starting program..." << endl;`). This will pause the program at line 16 once you start the debugger. In order to start your debugger, you have to set at least one break point, otherwise it will just run through the code normally. We set it at the start of the main function in order to step through our code line by line.

### Watching Variables/Arrays

Now, in the top right corner, there should be a button that is labeled "Debug C/C++ File". Click it, and you should be prompted to select a debug configuration. Select one that says `g++` (if there are multiple ones, just pick the first `g++` that you see).

Once your debugger starts, your interface will change. Lets look at the side bar first before we step through the program. In the first window in the top left we are able to see the variables, and all their values! The values of `myArray` can be seen with a dropdown menu by clicking on it. The values should look like junk right now, but that's only because we only declared the variables without assigning anything to them. You can keep an eye on the value of your variables as your progress through your code here.

<p align="center">
    <img src="images/variables.png" alt="Debugging Tab">
</p>

However, it is rare that you would care about *all* of your variables at the same time. Sometimes, you're only concerned with a few of them. That is what the `Watch` tab is for. We can add expressions we want to watch for, and it will alert us whenever they become true or false. You can add a variable and the debugger will tell you whenever it changes, or you can put in a boolean expression and it will tell you whenever it changes from true to false or vice versa. Here's an example of some types of expressions you can input into the watchpoint list:

<p align="center">
    <img src="images/watch.gif" alt="Watchpoint Tab">
</p>

Add some expressions into yours, and watch how they change once you input values into the array.

Something else you can do with this tool is change the value of your variables in the middle of your program! All you have to do is right click the variable, and select "Set Value" (or double click it). This is useful if you want to examine some sort of specific behavior at some value.

<p align="center">
    <img src="images/setvariable.gif" alt="Setting variable">
</p>

### Step In vs Step Over, and Step Out

We control the debugger using this bar right here:

<p align="center">
    <img src= "images/debuggingbar.png" alt="Debug Bar">
</p>

This bar is what you will use to control your debugger. The first button is "Continue", and pressing this button will run your program up until the next breakpoint. 

The next two buttons, "Step Over" and "Step Into" both execute the next line of code. However, if the next line of code is a *function*, then "Step Over" tells the debugger to literally *step over* the function, running the entire function, then go to the line after the function call. If you press "Step Into" instead, then the debugger *steps into* the function, allowing you to run the function line by line. You would use "Step Over" if you want to skip a function (maybe you know it already works, or you want to go further ahead into your code), whereas you would use "Step Into" if you want to run the function line by line. 

If you accidentally step into a function, or you want to "fast forward" to the end of a function, then pressing "Step Out" tells the debugger to *step out* of the function, by running all the lines of code up until the end of the function, pausing at the next line of code after the function call.

The next two buttons, "Restart" and "Stop" are self explanatory.

Here is an example of "Step Over":

<p align="center">
    <img src= "images/stepover.gif" alt="Stepping over">
</p>

...and here's an example of "stepping into and out":

<p align="center">
    <img src= "images/stepintostepout.gif" alt="Stepping into and out">
</p>

Feel free to step all over the program, and play around a bit with the debugger. The next section will go over how we use the debugger to find and diagnose crashes.

### Finding Crashes

In order to find a crash in our program, lets change our `main.cpp` file so that it doesn't work. Change the line `int* arrayPointer = myArray` to `int* arrayPointer = nullptr` (should be line 18). Compile and run the program just to make sure you have a segmentation fault (specifically, at the first input). 

Now, run your debugger through the program. It should terminate at the line where the segmentation fault happened. 

<p align="center">
    <img src= "images/segfault.gif" alt="Seg fault in debugger">
</p>

We can see that our program terminated at line 24, which is `*(arrayPointer + i) = input;`. From this line, we see that it is an assignment operation to a dereferenced integer pointer. Since segementation faults deal with memory, then our pointer must be the problematic variable here. We can check it in the variable list, and see it has the value `0x00`, which means it corresponds to a null pointer. Therefore, that is what is causing the crash.

Since the debugger told us exactly which line the crash happened, we were able to deduce what the error was based on the error message and the line itself. However, we still had to have some background knowledge - the debugger doesn't do *all* of the work for us!

### OPTIONAL: Call Stack

> Note: This section will be much more relevant once you study recursion. Feel free to skip for now if you don't need this section/are not interested.

A call stack, sometimes called the run-time stack or program stack, is something that a program uses to keep track of where it is if multiple functions are called within functions so it knows where to go back to once it finishes executing a function. Here is a visual example:

<p align="center">
    <img src= "images/callstack.png" alt="Call stack example">
</p>

In order to see the call stack in your debugger, copy-paste this example:

```cpp
#include <iostream>
using namespace std;

void d0(); void re(); void mi(); void fa(); void so(); void la(); void ti();

void dO()
{
    re();
    cout << "do" << endl;
}

void re()
{
    mi();
    cout << "re" << endl;
}

void mi()
{
    fa();
    cout << "mi" << endl;
}

void fa()
{
    so();
    cout << "fa" << endl;
}

void so()
{
    la();
    cout << "so" << endl;
}

void la()
{
    ti();
    cout << "la" << endl;
}

void ti()
{
    cout << "ti" << endl;
}

int main()
{
    dO();
}
```
Before you do anything: can you guess what the output will be?

Set your breakpoint to be the call to `d0();` in `main` and run the debugger, and keep an eye on the call stack tab in the bottom left corner. **Make sure you use "Step Into" here! Using "Step Over" will just skip the whole program.** As the functions are called, they are added to the call stack, then once that function is done, it goes to the previous function it was called from, and this continues. This kind of visualization will make it easier to see recursion, which is when a function calls itself.

### OPTIONAL: Debugging with Multiple Files

> Note: This section will be much more relevant once you start working with programs that consist of multiple files. Feel free to skip for now if you don't need this/are not interested.

The process for debugging with multiple linked source files requires some setup. By default, VSCode assumes that you are debugging only one file. In order to make it so the debugger recognizes that you have linked source files, we need to make a slight change. Notice that when you started the debugger, a new directory called `.vscode` was created within your directory. Open it, and you should see a file called `tasks.json`. This file is used by the debugger to pass in arguments to the debugger so you don't have to. We are interested in the block called `args`. You should see that there is a list of arguments in that block. They are telling the debugger where to look for the source files. Simply add whatever source files you want to debug as an argument in that block. If you want to debug all the source files in your directory, then replace the argument `"${file}"` with `"*.cpp"`.

## Examples of Common Errors using Pointers and Linked Lists

While it is a good skill to know how to use a debugger, it is still just a tool like a fancy text editor or a syntax highlighter. Technically, all you get out of a debugger is a deeper look at your program as you step through it line by line. It should not be used as a crutch, as it doesn't tell you anything other than the current variable values, memory locations, and where your program terminates. **To get legitimate value out of a debugger, you need to be able to trace your code and understand where the errors come from.** A debugger may be able to tell you the exact line your program came to a halt due to a segmentation fault, but that information doesn't mean much if you don't understand why your program would crash there. Being able to recognize patterns and common errors will allow you to get better use out of a debugger.

[Here](./main.cpp) is a small list of common errors made with pointers that your IDE won't bail you out of. While these errors are written in a way that it is obvious to spot what is wrong with each example, it is important to recognize that they exist and can be helpful in diagnosing what may be going wrong in your programs. The errors shown in that example may seem obvious now, but that is only because each error is presented in isolation; it is much harder to spot the exact error when looking at a file that is hundreds of lines long and these errors could potentially span across functions/scopes/files. Recognizing (no need to memorize, you'll run into them yourself eventually) the patterns here will help you find them down the line, and could save you countless hours of debugging.

> Note: It is important to understand the difference between undefined behavior and segmentation faults. Undefined behavior doesn't necessarily mean your program crashes; it means it behaves in a way that is unexpected and potentially changes every time you run the program. This makes it much harder to catch.
