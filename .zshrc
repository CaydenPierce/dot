# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/cayden/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
#ZSH_THEME="agnoster"
ZSH_THEME="powerlevel10k/powerlevel10k"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"
HISTFILE=~/.realhistoryzsh
HISTSIZE=500000
SAVEHIST=500000
setopt appendhistory
setopt INC_APPEND_HISTORY  
setopt SHARE_HISTORY

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
export NVM_LAZY_LOAD=true
export NVM_COMPLETION=true
plugins=(
	git
    # nvm
	colored-man-pages
    history-substring-search
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

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"


# cayden

export VISUAL=vim
export EDITOR="$VISUAL"

#colours
alias ls='ls --color=auto'
alias dir='dir --color=auto'
alias vdir='vdir --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

#aliases
alias ve='source ./venv/bin/activate'
alias dve='deactivate'
alias mve='python3 -m virtualenv venv'
alias pipr='pip3 install -r requirements.txt'
alias lsl='ls -ltrh'
alias i='sudo apt-get install'
alias pi='pip3 install'
alias hs='history | grep'
alias fadb='adb kill-server && adb start-server'
alias s='sudo'
alias xc='xclip -selection c'
alias mm='vim -c VimwikiIndex'
alias mmw="vim -c VimwikiIndex -c '/Wearable Intelligence System' -c 'call feedkeys(\"  \<CR>\")'"
alias devasp='cd ~/biggem/Tester/WearableIntelligenceSystem/android_smart_phone/main'
alias devaspapp='cd ~/biggem/Tester/WearableIntelligenceSystem/android_smart_phone/main/mediapipe/examples/android/src/java/com/google/mediapipe/apps/wearableai/'
alias devasg='cd ~/biggem/Tester/WearableIntelligenceSystem/android_smart_glasses/main'
alias devasgapp='cd ~/biggem/Tester/WearableIntelligenceSystem/android_smart_glasses/main/app/src/main/java/com/example/wearableaidisplaymoverio'
alias devglbox='cd ~/biggem/Tester/WearableIntelligenceSystem/gnu_linux_box'
#plugins and shit
#source /usr/share/powerlevel9k/powerlevel9k.zsh-theme
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
plugins=(virtualenv)

#funcs

function vimex(){
    cd ~/vimwiki
    vim ./$1
}

POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status virtualenv)

#vim mode
bindkey -v

#nvm
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
#export NVM_DIR="$HOME/.nvm"
#[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
#[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
#alias nvm="unalias nvm; [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"; nvm $@"

alias kg='killall glava'
alias sgd='glava --desktop'

# The next line updates PATH for the Google Cloud SDK.
#if [ -f '/home/cayden/programs/google-cloud-sdk/google-cloud-sdk/path.zsh.inc' ]; then . '/home/cayden/programs/google-cloud-sdk/google-cloud-sdk/path.zsh.inc'; fi
#
## The next line enables shell command completion for gcloud.
#if [ -f '/home/cayden/programs/google-cloud-sdk/google-cloud-sdk/completion.zsh.inc' ]; then . '/home/cayden/programs/google-cloud-sdk/google-cloud-sdk/completion.zsh.inc'; fi
##
##
#eval $(ssh-agent -s) && ssh-add ~/.ssh/githubnew
#
export ANDROID_HOME=/home/cayden/Android/Sdk
export ANDROID_NDK_HOME=/home/cayden/Android/Sdk/ndk/22.0.7026061/
#if [ -e /home/cayden/.nix-profile/etc/profile.d/nix.sh ]; then . /home/cayden/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer
#export LD_LIBRARY_PATH=/usr/lib/cuda/lib64:$LD_LIBRARY_PATH
#export LD_LIBRARY_PATH=/usr/lib/cuda/include:$LD_LIBRARY_PATH

xset r rate 160 35

DEFAULT_USER=$USER

# prompt_dir() {
#    prompt_segment blue $CURRENT_FG '%12~'
#}

timezsh() {
  shell=${1-$SHELL}
  for i in $(seq 1 10); do /usr/bin/time $shell -i -c exit; done
}

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
