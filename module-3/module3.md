# Introduction to GDB in VSCode

In this module, you will learn how to use the graphical version of the C++ debugger in VSCode, which runs on GDB (GNU Debugger).

## How to configure

## Examples of Common Errors using Pointers and Linked Lists

While it is a good skill to know how to use a debugger, it is still just a tool like a fancy text editor or a syntax highlighter. Technically, all you get out of a debugger is a deeper look at your program as you step through it line by line. It should not be used as a crutch, as it doesn't tell you anything other than the current variable values, memory locations, and where your program terminates. **To get legitimate value out of a debugger, you need to be able to trace your code and understand where the errors come from.** A debugger may be able to tell you the exact line your program came to a halt due to a segmentation fault, but that information doesn't mean anything if you don't know why your program would crash there. Being able to recognize patterns and common errors will allow you to get better use out of a debugger.

[Here](./main.cpp) is a small list of common errors made with pointers that your IDE won't bail you out of. While these errors are written in a way that it is obvious to spot what is wrong with each example, it is important to recognize that they exist and can be helpful in diagnosing what may be going wrong in your programs. Recognizing (no need to memorize, you'll run into them yourself eventually) the patterns here will help you find them down the line, and could save you countless hours of debugging.
