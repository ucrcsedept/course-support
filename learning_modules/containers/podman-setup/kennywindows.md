installing podman on windows

navigate to https://github.com/containers/podman/releases 
scroll down to assets tab


go to anaconda
https://www.anaconda.com 

pip3 –version

'podman-compose' is not recognized as an internal or external command,
operable program or batch file.



sudo curl -o /usr/local/bin/podman-compose https://raw.githubusercontent.com/containers/podman-compose/devel/podman_compose.py
'sudo' is not recognized as an internal or external command,
operable program or batch file.

C:\Users\thaik>curl -o /usr/local/bin/podman-compose https://raw.githubusercontent.com/containers/podman-compose/devel/podman_compose.py
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
  0     0    0     0    0     0      0      0 --:--:-- --:--:-- --:--:--     0Warning: Failed to open the file /usr/local/bin/podman-compose: No such file
Warning: or directory
 15  105k   15 16384    0     0   163k      0 --:--:-- --:--:-- --:--:--  164k
curl: (23) Failure writing output to destination

