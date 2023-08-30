## Potential Errors and Troubleshooting

### <u><b>Podman Machine and Container Errors</b></u>

This first part will include errors you may receive when starting your machine or container. If your error is unrelated to this and related to an issue in VSCode navigate [here](#vscode-extension-errors).

Here are some common errors you may encounter and the corresponding troubleshooting steps:
* <b>Error: failed to connect: dial tcp 127.0.0.1:53132: connect: connection refused</b>
* Stuck on <b>Waiting for VM ...</b>
* <b>Error: podman-machine-default: VM already exists</b>
* <b> Error: cannot start VM podman-machine-default: VM already running or starting </b>

To start, you can check if your machine is already running by using the following command:

```
podman machine info
```

Furthermore, you can determine which containers are currently in use with:

```
podman ps
```

These two commands will often help you identify the conflict as your machine and container is already running in the background. 

If you're still unable to identify the error, you can try the following commands to stop and remove the machine:

```
podman machine stop
podman machine rm
```

Afterward, restart the machine using:

```
podman machine init
podman machine start
```

Keep in mind that you may need to rebuild any containers that were lost during this process. You can find a reminder on how to do this [here](#creating-a-ucr-associated-container).
