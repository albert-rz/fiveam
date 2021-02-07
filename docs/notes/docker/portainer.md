# Portainer - A Docker GUI

### Introduction

Portainer is an open source container management tool for Kubernetes, Docker, Docker Swarm and Azure ACI (see [link](https://documentation.portainer.io/)). It allows containers deployment and management without the need to write code.

![portainer](../../assets/images/portainer.png)


### Running as a container

Portainer is run as Docker container. From the command line:

```
docker run -d -p 8000:8000 -p 9000:9000 --name=portainer --restart=always \
    -v /var/run/docker.sock:/var/run/docker.sock \
    -v portainer_data:/data portainer/portainer-ce
```

The application can be started and stopped like:

```bash
# Start
docker container start portainer

# Stop
docker container stop portainer
```

!!! tip
    We recommend to create a named container first (see `--name=portainer` option in the `docker run` above in the commands above) only once.
    
    Once created, simply use the `start` and `stop` actions.

### admin password

The very first time you execute Portainer you will be asked to set a password for the `admin` user. After that you will have to login:

![portainer_auth](../assets/images/portainer_auth.png)

Portainer also includes a tool (see [link](https://github.com/portainer/helper-reset-password)) to reset `admin` password:

```bash
# Stop the existing Portainer container
docker container stop portainer

# Run the helper using the same bind-mount/volume for the data volume
docker run --rm -v portainer_data:/data portainer/helper-reset-password

# Start portainer and use the password above to login
docker container start portainer
```

The `helper-reset-password` tool will output the new `admin` password.