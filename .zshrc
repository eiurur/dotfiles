# Path to your oh-my-zsh installation.
export ZSH=/home/vagrant/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
# ZSH_THEME="robbyrussell"
ZSH_THEME="gentoo"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
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
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
lugins=(git)

# User configuration

export PATH="/usr/local/bin:/usr/bin:/bin:/usr/bin/X11:/usr/games"
# export MANPATH="/usr/local/man:$MANPATH"

DISABLE_UPDATE_PROMPT=true

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
export LANG=ja_JP.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

export PATH=$PATH:$HOME/redis-3.0.7/src

# $B<+F0$G:n6H%m%0$r<hF@(B
#$B%f!<%6$N%m%0%$%s;~$KFCDj$N%G%#%l%/%H%j$X%m%0%U%!%$%k$rJ]B8(B
#${log_archive_directory}$B$OG$0U$N%G%#%l%/%H%j$r;XDj(B
#$B%m%0%U%!%$%kL>$O%m%0%$%s;~$NF|;~$H%m%0%$%s%f!<%6L>$rIUM?(B
# script -f /home/$(whoami)/$(date +%Y%m%d_%H%M%S)_$(whoami).log

alias script_date='script log-`date +%Y%m%d%H%M%S`'

source ~/.zshrc.pre-oh-my-zsh

# peco #
# $B%3%^%s%IMzNr$r=P$7$F8!:w!&9J$j9~$_$9$k$d$D(B
setopt hist_ignore_all_dups

function peco_select_history() {
  local tac
  if which tac > /dev/null; then
    tac="tac"
  else
    tac="tail -r"
  fi
  BUFFER=$(fc -l -n 1 | eval $tac | peco --query "$LBUFFER")
  CURSOR=$#BUFFER
  zle clear-screen
}
zle -N peco_select_history
bindkey '^r' peco_select_history

# ghq$B$G%/%m!<%s$7$F$-$?%l%]%8%H%j$X$N0\F0$,D=$k$d$D(B
# ghq list$B$G!"(Bghq$B$G%/%m!<%s$7$F$-$?%l%]%8%H%j$N%Q%9$,0lMw$G=P$k!#$3$l$r%Q%$%W$G(Bpeco$B$KEO$9$H!"%l%]%8%H%jL>$G%$%s%/%j%a%s%?%k%5!<%A$G$-$k$N$GMxMQ!#(B
function peco-src () {
  local selected_dir=$(ghq list -p | peco --query "$LBUFFER")
  if [ -n "$selected_dir" ]; then
    BUFFER=$(\history -n 1 | eval $tac | LANG=ja_JP.UTF-8 peco --query "$LBUFFER")    
    zle accept-line
  fi
  zle clear-screen
}
zle -N peco-src
bindkey '^]' peco-src

redis-server --daemonize yes

[[ -s "/home/vagrant/.gvm/scripts/gvm" ]] && source "/home/vagrant/.gvm/scripts/gvm"
