# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH:/Users/zenobio/.local/bin

# Path to your oh-my-zsh installation.
export ZSH="/Users/zenobio/.oh-my-zsh"
POWERLEVEL9K_MODE='nerdfont-complete'

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes

ZSH_THEME='powerlevel10k/powerlevel10k'

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# export PATH="/home/zenobio/.pyenv/bin:$PATH"
# eval "$(pyenv init -)"
# eval "$(pyenv virtualenv-init -)"

# export PYTHONPATH="/Users/Zenobio/.pyenv/shims/python3:$PYTHONPATH"

export PYTHONPATH="$(which python3)"

export PATH="/usr/local/opt/openssl/bin:$PATH"
export LDFLAGS="-L/usr/local/opt/openssl/lib"
export CPPFLAGS="-I/usr/local/opt/openssl/include"
export PKG_CONFIG_PATH="/usr/local/opt/openssl/lib/pkgconfig"

export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/platform-tools

# Garden & Macrocosm
export PATH=$PATH:~/.garden/bin

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  # zsh-autosuggestions
  # zsh-vi-mode
  zsh-syntax-highlighting
  nvm
  asdf
  docker
  docker-compose
  )

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

POWERLEVEL9K_SHORTEN_DIR_LENGTH=2
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(os_icon pyenv dir vcs)

POWERLEVEL9K_OS_ICON_BACKGROUND="white"
POWERLEVEL9K_OS_ICON_FOREGROUND="black"
POWERLEVEL9K_PYENV_BACKGROUND="grey35"
POWERLEVEL9K_PYENV_FOREGROUND="cyan"
POWERLEVEL9K_DIR_HOME_BACKGROUND="dodgerblue4a"
POWERLEVEL9K_DIR_HOME_FOREGROUND="white"
# POWERLEVEL9K_DIR_HOME_SUBFOLDER_BACKGROUND="dodgerblue4a"
POWERLEVEL9K_DIR_HOME_SUBFOLDER_BACKGROUND="grey7"
POWERLEVEL9K_DIR_HOME_SUBFOLDER_FOREGROUND="lightcyan3"
POWERLEVEL9K_DIR_DEFAULT_FOREGROUND="white"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
alias zshconfig="nvim ~/.zshrc"
alias vimconfig="nvim ~/.config/nvim"
alias vlimeopen="sbcl --load ~/.vim/plugged/vlime/lisp/start-vlime.lisp"
alias sbcl="rlwrap sbcl"
alias league="open /Applications/League\ of\ Legends.app/Contents/LoL/LeagueClient.app --args --locale=en_US"
alias leaguejp="open /Applications/League\ of\ Legends.app/Contents/LoL/LeagueClient.app --args --locale=ja_JP"
alias gtcm="git log | head -n1 | awk '{print \$2}' | pbcopy"
alias killpoe="top | grep 'PathOfExileClien' -m 1 | awk '{print $1};' | xargs kill -9"
alias ngrok="~/./ngrok"
alias enablepnpm="corepack enable & corepack prepare pnpm@7.29.1"
 

# Useful to know which branch hasn't pushed to remote yet.
alias gblw="git for-each-ref --sort=-committerdate refs/heads/"

# Get local branches by slices of names.
gtbslice() {
  if [ -n "$1" ]
  then
    FOUND=$(git branch | grep $1 | awk '{if($1=="*"){print $2} else {print $1}}')
    echo "Branch(s) Found: ${FOUND}"
    echo "${FOUND}" | pbcopy
  else
    echo "Needs at least a \"slice\" of any branch name."
  fi
}

# Kill process by port
killprocessbp() {
  PID=$(lsof -i ":${1}" | awk '$2 ~ /^[0-9]*$/ {print $2;}')
  kill -9 "`:`${PID}"

  [ $? -eq 0 ] && echo "Killed..." || echo "PID=${PID} <> PORT=${1}"
}

# alias pbcopy | pbpaste for linux
# alias pbcopy='xclip -selection clipboard'
# alias pbpaste='xclip -selection clipboard -o'
###

# alias ohmyzsh="mate ~/.oh-my-zsh"
[[ -s $HOME/.nvm/nvm.sh ]] && . $HOME/.nvm/nvm.sh # This loads NVM

##Add Coq ENV vars on init
# [[ -f coq-shell\~8.16\~2022.09.command && -z "${COQLIB}" ]] && ./coq-shell\~8.16\~2022.09.command

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
source ~/.oh-my-zsh/custom/themes/powerlevel10k/powerlevel10k.zsh-theme

# asdf
. $HOME/.asdf/asdf.sh
. $HOME/.asdf/completions/asdf.bash
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

source /Users/zenobio/.docker/init-zsh.sh || true # Added by Docker Desktop

# opam configuration
[[ ! -r /Users/zenobio/.opam/opam-init/init.zsh ]] || source /Users/zenobio/.opam/opam-init/init.zsh  > /dev/null 2> /dev/null
