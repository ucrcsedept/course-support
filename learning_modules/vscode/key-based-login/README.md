To go back to the previous section, where we go over how to setup VSCode with SSH, click [here](../installation-and-setup/).

# Optional (but recommended!): Key-Based Automatic Login

Notice that when you want to open a folder, you are prompted to enter your password again. This essentially makes it so you have to input your password twice to log in, which gets very tedious. In this section, you can set up Remote-SSH to remember your password so you only have to input it once.

Instructions vary based on operating system:

<details>
<summary><b>Windows 10/11</b></summary>

In order to set up key based login with SSH, we will first have to install an SSH client.

> NOTE: Steps 1-3 are for users who are on Windows 10. If you are on Windows 11, you can skip steps 1-3 and start from step 4.

1. Go to the Start Menu and search for "Add an Optional Feature"
2. Click "Add a feature"
3. Search for OpenSSH Server and install

<p align="center">
    <img src="images/openssh.gif" alt="Installing SSH client on Windows">
</p>

Now, we will generate something called a public/private key pair, which we will use to log into the class server.

4. Open a PowerShell terminal by pressing (Windows Key + R) which opens the "Run" application, and then type in `powershell` which opens a PowerShell terminal.
5. Run the following command:

``` ssh-keygen ```

The output should be the following:
```
Generating public/private rsa key pair.
Enter file in which to save the key [your path here]:
```

The name of the file can be whatever you want it to be.

Now, you will be prompted with this:

```
Enter passphrase (empty for no passphrase):
```

**If you want to log in automatically without entering a password, then do not enter a passphrase**. This will require you to enter your passphrase every time you want to log in, which defeats the purpose of automatically logging in with your public/private key pair. Press Enter twice to proceed without entering a passphrase.

</details>

<details>
<summary><b>MacOS/Linux (Debian-based)</b></summary>
We will generate something called a public/private key pair, which we will use to log into Remote-SSH.

1. Open a *local* terminal on your Mac by pressing Cmd + Space and typing in "Terminal", and run the following commands in this order:
```
cd .ssh
ssh-keygen -t rsa -b 4096
```

The output should be the following:
```
Generating public/private rsa key pair.
Enter file in which to save the key [your path here]:
```
The name of the file can be whatever you want it to be. For the purposes of the tutorial, the name we will be using is ```mysshkey```. If you use something else, substitute the name wherever we use ```mysshkey```.

Now, you will be prompted with this:

```
Enter passphrase (empty for no passphrase):
```

**Do not enter a passphrase**. This will require you to enter your passphrase every time you want to log in, which defeats the purpose of automatically logging in with your public/private key pair. Press Enter twice to proceed without entering a passphrase. Note that there is a tradeoff between security and convenience with this method, as anyone with access with your device will be able to log into UCR servers.

You should see two files in the `.ssh` directory named `mysshkey` (or whatever you named your keys). The one without a file extension is your *private* key, **which you should never, ever share with ANYONE**. The one with a file extension of `.pub` is your *public key*.

2. Run the following command:

```
cat mysshkey.pub
```
Copy the (very long) output using Ctrl+Shift+C, or Cmd+V+C on Mac. This is your public key.

3. SSH into UCR servers using the method outlined in "Part 1: Installation and Configuration" above.
4. Make a new folder called `.ssh`, and in there create a file called `authorized_keys`. Paste in the public key, and save the file. For this to work, these must be the exact names of the folder and the file.

<p align="center">
    <img src="images/savingpublickey.gif" alt="Saving public key on server">
</p>

5. Open another terminal, and run the following commands in this order:

```
cd .ssh
echo -e '\tIdentityFile /home/~/.ssh/mysshkey' >> config
```

What the second command does is append a command to the end of your SSH config file that reads the private key, which authenticates you without the need for entering your password.

</details>

