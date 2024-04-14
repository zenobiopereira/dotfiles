## Installation

### **1** - Install Nvim

```sh
apt install neovim
```

### **2** - Run line by line inside **Neovim**:

```sh
# For some reason $XDG_HOME_CONFIG does not work.
# Set the $CONFIGPATH for the next command.
:call setenv('CONFIGPATH', stdpath('config'))

# Download the content of the ".config" folder.
:!curl -L -k "https://github.com/zenobiopereira/dotfiles/tarball/master" | tar -xz -C $CONFIGPATH

# Open the $CONFIGPATH
:e $CONFIGPATH

# Find and move everything within the _nvim_ folder to the root of **$CONFIGPATH**.
```

## Steps that maybe not be necessary anymore...

### ReasonML:

- [Reason LSP](https://github.com/jaredly/reason-language-server)

```sh
sh -C "$(wget https://github.com/jaredly/reason-language-server/releases/download/1.7.13/rls-linux.zip && unzip -n rls-linux.zip -d ~)"
```
