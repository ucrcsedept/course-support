## What is an IDE?

An IDE, or an integrated development environment, is a piece of software that provides us with a multitude of different components in one user interface to maximize productivity. The most common features in an IDE are a code/text editor (usually with syntax highlighting), build automation (a compiler, version control like Git, or automated testing), and a debugger. While IDEs are not required (you have written and compiled code without one before), they provide the tools to create bigger projects, collaborate with others, and make development more convenient.

## Why VSCode?

VSCode is an incredibly popular IDE (<a target="_blank" rel="noopener noreferrer" href="https://insights.stackoverflow.com/survey/2021">the most popular in the world, actually!</a>), and for good reason. We chose it for this class because it is very lightweight and widely supports most langauges and features that are considered essential for development. It also has a large marketplace of extensions that make it easy to extend and personalize your version of VSCode. This doesn't mean that VSCode is the **best** IDE out there; we encourage you to get experience with other IDEs if you wish/if you are ever required to use a different one. Here are some general questions that you should ask yourself for finding an IDE that suits your needs:

* Does the IDE support the programming languages I am going to use? (Bonus: is it recommended by the development community as a good option for those languages)
* Is it mature and well supported?
* Does it support collaboration and a direct connection to a respository?
* Does it support other technology I will use for my project? (connecting to servers, alternative testing frameworks, etc.)
* Does it have code autocomplete?
* Does it work with my operating system?
* Do I have to pay a license for it?
* Can I customize it however I want?

What we will be doing now is using VSCode to connect to UCR servers. The UCR servers already have a fully configured workspace for you (a compiler, and a way to save your work across devices), so combined with the graphical interface of VSCode, you will have everything you need for this class. Of course, if you feel comfortable, feel free to use your own personal environment if you have one configured/are willing to learn how.

## Optional: Useful Features of VSCode

VSCode has many useful features that help increase your productivity. You will learn more about some of these features later (debugging, how to use your terminal, and other features when editing multiple files at once), but some of the editing features that will be useful to you right now are:

| ![Multiple Cursors](images/multiplecursor.gif) | ![Rename Variables](images/renamevariable.gif) | ![Go to Definition](images/gotodefinition.gif)
| :--: | :--: | :--: |
| *Alt + Left Click to add a cursor*| *Rename variables/functions easily and quickly*| *Go to definition/declaration of a variable/function* 

| ![Highlight and Comment](images/highlightandcomment.gif)| ![Move Line](images/moveline.gif)|
| :--: | :--: |
| *Highlight line by line with Ctrl + L or Cmd + L, then comment with Ctrl+/ or Cmd+/* | *Move a line of code with Alt + Arrow Keys* |

Another useful setting is in File > Auto Save, to prevent yourself from potentially losing progress.

To find even more useful commands, press F1 to bring up the Command Palette that allows you to search for whatever command you need. <a target="_blank" rel="noopener noreferrer" href="https://code.visualstudio.com/docs/getstarted/keybindings">Here</a> is a list of keybindings if you wish to get familiar with the many shortcuts in VSCode.

We encourage you to become more familiar and comfortable with your new development environment. Make it your own! Install a theme, use some fun extensions, and play around in C++. You can create your own keybinds and themes, and add your own extensions from the marketplace. Later in this course, we will go over some more useful features that you will be able to use in future courses and beyond.
