# A clean environment with a nice shell for Python development. 

## Handy commands

*docker shell with underprivileged user*

`bin/cli` 

*docker shell with root user*

`bin/root-cli`

*sets up a development-capable environment*

`docker compose up|down`

*rebuild the docker container*

`docker compose build`

*activate the venv environment from within the cli*

`source /work/.venv/bin/activate`

## Notes

This container inherits from python:3.9.

This docker container mounts the current directory into /work, where all the things happen. 

It also has an underprivileged user and a root user. 

It sets the gid and uid of the underprivileged user to 1000 and 1000, which is a common uid/gid combo for the first user on a system.

This allows you to edit your files without the mess of permissions issues from within this folder.

You'll want to take a look at the bash script that the container ultimately runs `bin/runner` for an example of how to bootstrap your app.
