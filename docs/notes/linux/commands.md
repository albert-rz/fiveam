# Commands

### Check version

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