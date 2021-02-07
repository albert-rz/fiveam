# Useful tools

### Shutter

Shutter is a feature-rich screenshot program. 

You can take a screenshot of a specific area, window, the whole screen, or even of a website. You can also edit screenshots to highlight points

##### Installation

```bash
sudo add-apt-repository -y ppa:linuxuprising/shutter

sudo apt-get install shutter
```

### Xournal

Xournal is an application for note taking and sketching using a stylus. It can be used to annotate a PDF.
 
Xournal is compatible with **Wacom** tablets.

##### Installation

```bash
sudo apt-get install xournal
```

### wmctrl

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