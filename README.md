Installing Nvim

*1*. apt install neovim

*2*. Check if exists **~/.config/nvim/init.vim** -> (if exists, go to step 4)

*3*. run inside nvim:
```
:call mkdir(stdpath('config'), 'p')
:exe 'edit '.stdpath('config').'/init.vim'
```
*4*. write at init.vim
```shell
set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc
```
*5*. Run:
```shell
sh -C "$(curl -o ~/.vimrc https://raw.githubusercontent.com/zenobiopereira/dotfiles/master/init.vim)"
```

### ReasonML:
- [Reason LSP](https://github.com/jaredly/reason-language-server)

```shell
sh -C "$(wget https://github.com/jaredly/reason-language-server/releases/download/1.7.13/rls-linux.zip && unzip -n rls-linux.zip -d ~)"

```
