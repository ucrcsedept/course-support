## Docker for Course Support

### Directory Structure

Each directory named after a CS course (`cs010a`, `cs010b`, ....) in the [/docker](/docker) directory contains the following for that course:

- A `Dockerfile` and `docker-compose.yml` file that can be used to set up a container that runs the software used by the course. `docker compose` can be run on personal computers, laptops, and servers that have Docker installed in order to build and run the container specified in the `Dockerfile`.

- A wrapper script with the same name as the course directory for running a Singularity/Apptainer container for the course. This would typically be run on a CSE departmental server, so that running `cs100` for example would run the container for CS 100. The Singularity container will have exactly the same software and environment as specified in in the Dockerfile. This is accomplished by converting the Dockerfile into a Singularity recipe, then building the container. This conversion process is out of the scope of this repository.

- A JupyterHub kernel named `COURSENAME_kernel.json` for running a Singularity/Apptainer container on a JupyterHub server. For example, the kernel for CS 171 would be named `cs171_kernel.json`. This would typically be a CSE departmental server. The Singularity  container will have exactly the same software and environment as specified in in the Dockerfile. This is accomplished by converting the Dockerfile into a Singularity recipe, then building the container. This conversion process is out of the scope of this repository. Not all courses are run in a JupyterHub environment, so not all directories have a kernel script.

### For Instructors and TAs

Instructors and TAs can fork this repository and submit a pull request in order to update the `Dockerfile` being used to provide software for their course. You can follow the same procedure that students use (see below) to set up Docker on any system that you want to test out new software for your course on.

### For Students

If you are required to use Docker for your course, or if you are just interested in setting up Docker on your own computer and using it there, you can follow the instructions on [Accessing Containers on Local Machine with Docker](/learning_modules/docker/docker-setup/README.md) in order to do so. You can use the `Dockerfile` and `docker-compose.yml` file for any of the courses in this repossitory when you do so.