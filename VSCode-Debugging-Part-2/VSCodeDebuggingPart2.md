# Debugging Tutorial Part 2

> Authors: Victor Hill and Joshua Candelaria (special thanks to Professor Neftali Watkinson and Professor Kris Miller)

You have already learned how to use a debugger to help you diagnose issues found in programs that use pointers. Now, you will learn about the tools used to debug recursive functions. Today, you will learn:

* What the call stack is, and visual representations of it.
* How to use a debugger with a recursive function

## Call Stack

> Note: The following example came from the first debugging tutorial, where it was presented as an optional introduction to the call stack. Feel free to skip if you already went over it.

A call stack, sometimes called the run-time stack or program stack, is something that a program uses to keep track of where it is if multiple functions are called within functions so it knows where to go back to once it finishes executing a function. Here is a visual example:

<p align="center">
    <img src= "images/callstack.png" alt="Call stack example">
</p>

In order to see the call stack in your debugger, copy-paste this example:

```cpp
#include <iostream>
using namespace std;

void _do(); void re(); void mi(); void fa(); void so(); void la(); void ti();

void _do()
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
    _do();
}
```
*Before you do anything: can you guess what the output will be?*

Set your breakpoint to be the call to `d0();` in `main` and run the debugger, and keep an eye on the call stack tab in the bottom left corner. **Make sure you use "Step Into" here! Using "Step Over" will just skip the whole program, as it will step over all the functions at once.** As the functions are called, they are added to the "top" of the call stack, then once that function is done, it goes to the previous function it was called from, and this continues. This kind of visualization will make it easier to see recursion.

Even without a recursive function, it is still useful to have the call stack visualized when you have several "nested" function calls, so you can tell where you will return to once each function call is finished. It will be especially useful in programs that are larger in scope, as you can tell if a program is working as expected quickly by examining the call stack.

## Recursion 

As you have learned in lecture, a recursive function is a function that breaks a problem into smaller sub-problems in order to solve the original problem. However, since we usually think iteratively, it is hard to grasp the concept of recursion at first. In order to help visualize recursion, it is helpful to have a look at the call stack, and of each input at each recursive step.

Create a new `example` directory, and inside, create a `main.cpp` file with the following contents copy pasted in:

```cpp
#include <iostream>
using namespace std;

int factorial(int n)
{
   if (n == 1) return 1;
   int answer = n * factorial(n-1);
   return answer;
}

int main()
{
   int input;
   cin >> input;
   int answer = factorial(input);
   cout << "Factorial of " << input << ": " << answer << endl;
}
```

## Examples of Common Errors using Recursion