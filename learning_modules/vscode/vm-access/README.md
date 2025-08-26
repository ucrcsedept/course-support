# Accessing Course-Specific VMs

In this module, we will be going over how to access VMs specific to certain courses at UCR. As of Summer 2025, the courses that this module applies to are (note that this may be outdated):

- CS165
- CS167
- CS172
- CS173
- CS178A
- CS179G
- CS179J
- CS181
- CS190

In this module, we will be using CS179G as an example, so substitute your applicable course.

**IMPORTANT**: Before we proceed, make sure that you have a CS account. If you **don't have one/aren't sure if you have one**, <a target="_blank" rel="noopener noreferrer" href="https://sites.google.com/a/ucr.edu/cse-instructional-support/home/accounts#h.r2x4rti8gpg9">go to this link</a> to set one up. The same site will help if you **forgot your password and need to reset it**.

## Directions

1. SSH to the `bolt` server with the following command:

``` ssh [YOUR UCR NETID]@bolt.cs.ucr.edu ```

Log in with your CS password.

> Note: If you haven't set up key-based login yet, now would be a good time. [Here](../key-based-login/README.md) is a tutorial on how to do so.

2. Every single course with VMs will have a login script that will be in your `PATH`. Run the script with the following form: `[COURSE]_login`. For example:

``` [jcand014@bolt ~]$ cs179g_login ```