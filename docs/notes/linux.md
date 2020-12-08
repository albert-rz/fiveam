# Linux notes

## Commands

#### Check version

```bash
# Check version using lsb_release
lsb_release -a

# Check only the codename in short format
lsb_release -cs

# Check version using /etc/os-release
cat /etc/os-release
```

## Common steps after installation

```bash
# Upagrade
sudo apt-get update
sudo apt-get upgrade -y
sudo apt-get autoremove -y

# Common packages
sudo apt-get install -y build-essential
sudo apt-get install -y make
sudo apt-get install -y ctags
sudo apt-get install -y git
sudo apt-get install -y python3-dev
sudo apt-get install -y python3-pip
sudo apt-get install -y python3-venv
sudo apt-get install -y python3-wheel python-wheel-common

# Git config
git config --global user.name "<your user name>"
git config --global user.email <your email>
git config --global core.editor code
git config --global core.ignorecase false
```

## Startup applications

Open `Startup Applications` and add/remove applications.

![startup_applications](../assets/images/startup_applications.png)

## Useful tools

#### Shutter

```bash
# Add apt-repo
sudo add-apt-repository -y ppa:linuxuprising/shutter

# Install
sudo apt-get install shutter
```

#### wmctrl

```bash
# List applications
wmctrl -l

# Rise an application
wmctrl -r Application name -e gravity,x,y,width,height
```