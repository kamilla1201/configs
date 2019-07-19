# Path to oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME=mh

# Command auto-correction
ENABLE_CORRECTION="true"

# oh-my-zsh plugins
plugins=(
  git colored-man-pages colorize cp sublime zsh-syntax-highlighting zsh-history-substring-search
)

source $ZSH/oh-my-zsh.sh

# ssh
export SSH_KEY_PATH="~/.ssh/rsa_id"

# turn on command substitution in the prompt
setopt PROMPT_SUBST

# load the prompt themes system
autoload -Uz promptinit
autoload -U colors && colors
promptinit

# time and date on the right side of the screen
RPROMPT="%{$fg[cyan]%}[%* on %D]%{$reset_color%}"

# customize the word style
autoload -U select-word-style
# Word characters are alphanumerics plus \$WORDCHARS
select-word-style normal
export EDITOR=vi

setopt histignorealldups sharehistory
# type the name of a directory, and it will become the current 
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
HISTSIZE=100000
SAVEHIST=100000
HISTFILE=~/.zsh_history

alias gh=fg

alias vi=vim
alias ls='ls --color=auto' # should be removed on macos
alias la='ls -A'

alias grep='grep 2>/dev/null --color -nHI'
alias gerp='grep 2>/dev/null --color -nHI'
alias j=jobs
alias find='find 2>/dev/null'

# python aliases
alias pi2="sudo pip2 install --upgrade"
alias pi3="sudo python3 -m pip install --upgrade"
alias py="/usr/bin/python"
alias py3="/usr/bin/python3"

# c++ aliases
alias c="g++ --std=c++11 -Wall -Wextra -O2"

# git aliases
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

#alias git=git-together
# Use modern completion system
autoload -Uz compinit
compinit

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select
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
export GIT_TOGETHER_NO_SIGNOFF=1

unset command_not_found_handle

#if [[ "$(uname -a)" =~ "CYGWIN" ]]; then
#  alias op=explorer
#  RECYCLE_BIN_PATH="C:/\$Recycle.Bin"
#  function rm() { mv "$@" "$RECYCLE_BIN_PATH" }
#fi

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/kamilla/exec -l /usr/bin/zsh/google-cloud-sdk/path.zsh.inc' ]; then . '/home/kamilla/exec -l /usr/bin/zsh/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/kamilla/exec -l /usr/bin/zsh/google-cloud-sdk/completion.zsh.inc' ]; then . '/home/kamilla/exec -l /usr/bin/zsh/google-cloud-sdk/completion.zsh.inc'; fi
export AWS_DEFAULT_REGION='us-west-2'
export AWS_REGION='us-west-2'


zstyle ':completion:*:*:git:*' script ~/.zsh/git-completion.bash
fpath=(~/.zsh $fpath)

autoload -Uz compinit && compinit

