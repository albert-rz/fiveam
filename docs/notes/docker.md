# Docker notes

## Commands

#### List images

```bash
# List all images
docker images

# List images IDs
docker images -q
```

#### Delete images

```bash
# Delete image by ID
docker rmi <image-id>

# Delete all images
docker rmi $(docker images -q)
```

#### Build an image

```bash
# Build from a Dockerfile in the current directory and tag the image
docker build -t myimage:1.0 .
```

#### List containers

```bash
# List running containers
docker container ls

# List all containers
docker container ls -a

# List all container IDs
docker container ls -a -q 
```

!!! tip
    `container ls` has some alias: `ps`.

#### Run a container

```bash
TODO
```

## Glossary

{% include 'glossary/docker.md' %}
