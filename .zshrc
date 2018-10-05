# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/Kamilla/.oh-my-zsh"

ENABLE_CORRECTION="true" # Command auto-correction

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git colored-man-pages colorize cp sublime zsh-syntax-highlighting zsh-history-substring-search
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# ssh
export SSH_KEY_PATH="~/.ssh/rsa_id"

setopt PROMPT_SUBST
autoload -Uz promptinit
autoload -U colors && colors
promptinit

RPROMPT="%{$fg[cyan]%}[%* on %D]%{$reset_color%}"

autoload -U select-word-style
select-word-style bash
export EDITOR=vi

setopt histignorealldups sharehistory
setopt autocd

export TERM='xterm-256color'
if test -n "$TMUX"; then
	export TERM='screen-256color'
fi

# Use emacs keybindings even if our EDITOR is set to vi
bindkey -e
bindkey '^[[1;3C' emacs-forward-word #'^[O1;5C' emacs-forward-word
bindkey '^[[1;3D' emacs-backward-word
bindkey "^[[1~" beginning-of-line # Home
bindkey "^[[4~" end-of-line # End
bindkey "^[[3~" delete-char # Del

# Keep 100000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh_history

alias vi=vim
alias ls='ls --color=auto'
alias la='ls -A'

alias grep='grep 2>/dev/null --color -nHI'
alias gerp='grep 2>/dev/null --color -nHI'
alias j=jobs
alias find='find 2>/dev/null'

alias btd="MVN_OPTS='-DskipTests -Dmaven.clean.failOnError=false -Dmaven.javadoc.skip=true' ./build/build.sh"

# Use modern completion system
autoload -Uz compinit
compinit

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select
eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
#zstyle ':completion:*' verbose true

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

export PATH=$HOME/bin:/usr/local/bin:$PATH

unset command_not_found_handle

### git ###
alias gl="git log"
alias gf="git fetch"
alias glf="git log --name-only"
alias glga="git log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %s%C(reset) %C(dim white)- %an%C(reset)%C(bold yellow)%d%C(reset)' --all"
alias glg="git log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %s%C(reset) %C(dim white)- %an%C(reset)%C(bold yellow)%d%C(reset)'"
alias gs="git status"
alias gss="git status -s"
alias gc="git checkout"
alias gcmm="git commit -m"
alias gr="git remote"
alias gch="git fetch"
alias ga="git add"
alias gb="git blame"
alias gd="git diff"

alias gst='git stash'
alias gsp='git stash pop'

alias gr='git rebase'
alias gpr='git pull --rebase'
alias gprc='git pull --rebase origin integration-controlpath'
alias gprp='git pull --rebase origin integration-platform'

if [[ "$(uname -a)" =~ "CYGWIN" ]]; then
  alias op=explorer
#  RECYCLE_BIN_PATH="C:/\$Recycle.Bin"
#  function rm() { mv "$@" "$RECYCLE_BIN_PATH" }
fi