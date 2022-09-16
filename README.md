# course-support

This repository contains material related to the support of Computer Science courses
at the University of California, Riverside.  There are 3 sections:

- [Learning Modules for Technologies](#learning-modules-for-technologies) Modules for introducing 
technologies that are widely used in courses, and using them for specific activities such as debugging.

- [Software for Course Support](#software-for-course-support) Dockerfiles, Jupyter kernels, and other
software used by courses.

- [Course Specific Material](#course-specific-material) Links to documentation for any courses that are 
actively using this repository for their software.

## Learning Modules for Technologies

Some technologies such as [Visual Studio Code](https://code.visualstudio.com/) and 
[Docker](https://docs.docker.com/get-docker/) are widely used in industry, and also 
available for use in CS courses. There's some content about how to use them in CS 
courses below; this can be used to learn these technologies for the first time, or 
as a refresher.  If you are in a specific course, only some of this material may be 
used.  You can refer to the [Course Specific Material](#course-specific-material) section to see 
what material is relevant to any specific course.

- [Visual Studio Code](/learning_modules/vscode/README.md)
- [Docker](/learning_modules/docker)

## Software For Course Support

The software to support each course is in a subdirectory named for the course.  This is typically a Dockerfile, 
docker-compose.yml file, kernel.json file for running the software in Jupyter, and wrapper script for running
the software on CSE servers. These can be updated via pull requests from instructors and TAs.  Full documentation 
is available in the section on [Docker for Course Support](docker/README.md)

## Course Specific Material

The material that is used by for each course is linked below.

- [CS 010B](/courses/cs010b/README.md)
- [CS 100](/courses/cs100/README.md)

Note: If a course you are taking isn't listed here, that likely means it is using
some software that isn't documented here yet, for example use of VirtualBox in CS 164.
In that case, some of the content on specific technologies (such as Visual Studio Code) 
in the section on [Learning Modules for Technologies](#learning-modules-for-technologies) 
may still be useful to you.


