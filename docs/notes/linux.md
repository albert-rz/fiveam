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

### Reload .bashrc

Assuming that your .bashrc file is in HOME:

```bash
source ~/.bashrc
```

## Common steps after installation

```bash
# Upgrade
sudo apt-get update
sudo apt-get upgrade -y
sudo apt-get autoremove -y

# Common packages
sudo apt-get install -y build-essential
sudo apt-get install -y make
sudo apt-get install -y ctags
sudo apt-get install -y git

# Zsh and Oh-My-Zsh
sudo apt-get install -y zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Common Python packages
sudo apt-get install -y python3-dev
sudo apt-get install -y python3-pip
sudo apt-get install -y python3-venv
sudo apt-get install -y python3-wheel python-wheel-common

# Install NodeJS
# Source: https://github.com/nodesource/distributions/blob/master/README.md
curl -sL https://deb.nodesource.com/setup_14.x | sudo -E bash -
sudo apt-get install -y nodejs
```

## Git configuration

```bash
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

Shutter is a feature-rich screenshot program. 

You can take a screenshot of a specific area, window, the whole screen, or even of a website. You can also edit screenshots to highlight points

##### Installation

```bash
sudo add-apt-repository -y ppa:linuxuprising/shutter

sudo apt-get install shutter
```

#### Xournal

Xournal is an application for note taking and sketching using a stylus. It can be used to annotate a PDF.
 
Xournal is compatible with **Wacom** tablets.

##### Installation

```bash
sudo apt-get install xournal
```

#### wmctrl

wmctrl is a command that can be used to interact with an X Window manager.


##### Installation

```bash
sudo apt-get install wmctrl
```

##### Usage

```bash
# List applications
wmctrl -l

# Rise an application
wmctrl -r Application name -e gravity,x,y,width,height
```