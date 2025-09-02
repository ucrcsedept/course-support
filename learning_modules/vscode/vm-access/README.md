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

## Accessing via Shell

These 2 steps will allow you to SSH into the proper VM for the class server. Most of the work is in a wrapper script already present on `bolt`.

1. SSH to the `bolt` server with the following command:

``` ssh [YOUR UCR NETID]@bolt.cs.ucr.edu ```

Log in with your CS password.

> Note: If you haven't set up key-based login yet, now would be a good time. [Here](../key-based-login/README.md) is a tutorial on how to do so.

2. Every single course with VMs will have a login script that will be in your `PATH`. Run the script with the following form: `[COURSE]_login`. For example:

``` [jcand014@bolt ~]$ cs179g_login ```

If you would like to set up VSCode, then take note of what your specific VM is. For example, when running this script, I am automatically assigned to `class-141.cs.ucr.edu` under the `cs179g` user. 

```cs179g@class-141:~$```

## Accessing via VSCode

If you would rather have the VSCode interface when accessing a VM for a course server, here are the steps to do so. Ensure that you have done the above steps already.

1. Ensure that you have key based login enabled for `bolt` from your personal machine. [Here](../key-based-login/README.md) is a tutorial on how to do so.

2. On your personal machine, copy your public SSH key. By default, they are located in the following places:

Linux/Mac: ~/.ssh/id_rsa.pub
Windows: C:\Users\[your user]\.ssh\id_rsa.pub

Copy the contents of the `id_rsa.pub` file.

3. Log back into the class VM, and open the following file in Vim:

```vim ~/.ssh/authorized_keys```

Paste in your public key; you may have to add a new line before you paste, as your groupmates (if any) may have also added in their public keys.

4. Test that key based access is working by running the following command on your personal machine:

```ssh -J [YOUR UCR NETID]@bolt.cs.ucr.edu [YOUR CLASS]@class-###.cs.ucr.edu```

Substitute [YOUR UCR NETID] for your NetID, [YOUR CLASS] for your course number (ex. cs179g), and ### for the VM number you saw in the Accessing via Shell steps (in the above example, it would be 141).

If key based access is working properly, you should be logged into your class VM without a password.

5. In VSCode, open the command palette from the top bar by selecting View > Command Palette. Search for "Remote-SSH: Open SSH Configuration File", and open the first option, which is where the default SSH configuration is located

6. Enter the following lines into your configuration file, making the same substitutions you made in step 4:

```
Host [YOUR CLASS]
  HostName class-###.cs.ucr.edu
  User [YOUR CLASS]
  ProxyJump [YOUR UCR NETID]@bolt.cs.ucr.edu
```
7. You can test this by doing `ssh [YOUR CLASS]` on your machine, and using VSCode to connect. If you need a refresher on how to SSH using VSCode, start from step 3 in [this](../installation-and-setup/README.md) tutorial