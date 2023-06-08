Installing Nvim

### **1** -  apt install neovim

### **2** - Run line by line inside **Neovim**:
```shell
# For some reason $XDG_HOME_CONFIG does not work.
# Set the $CONFIGPATH for the next command.
:call setenv('CONFIGPATH', stdpath('config'))

# Download the content of the ".config" folder.
:! curl -L -k "https://github.com/zenobiopereira/dotfiles/tarball/master" | tar -xz -C $CONFIGPATH

# Open the $CONFIGPATH
:e $CONFIGPATH
```

### **3** - Move the downloaded *nvim* folder to your current **$CONFIGPATH**.



---
## Might not be necessary anymore...
### ReasonML:
- [Reason LSP](https://github.com/jaredly/reason-language-server)

```shell
sh -C "$(wget https://github.com/jaredly/reason-language-server/releases/download/1.7.13/rls-linux.zip && unzip -n rls-linux.zip -d ~)"
```
