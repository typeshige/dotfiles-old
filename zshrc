# Path to your oh-my-zsh configuration.
export ZSH=$HOME/.oh-my-zsh

export ZSH_THEME="blinks"

# Set to this to use case-sensitive completion
# export CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# export DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# export DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# export DISABLE_AUTO_TITLE="true"

plugins=(pip fabric git django github vi-mode virtualenvwrapper)

source $ZSH/oh-my-zsh.sh

setopt AUTO_CD


# Customize to your needs...
#

# If I am using vi keys, I want to know what mode I'm currently using.
# zle-keymap-select is executed every time KEYMAP changes.
# From http://zshwiki.org/home/examples/zlewidgets

function zle-line-init zle-keymap-select {
    RPS1="${${KEYMAP/vicmd/-- NORMAL --}/(main|viins)/}"
    RPS2=$RPS1
    zle reset-prompt
}

zle -N zle-line-init
zle -N zle-keymap-select


export WORKON_HOME=~/.virtualenvs
source /usr/local/bin/virtualenvwrapper.sh
if [ -d ~/djangotools ]; then
    source ~/djangotools/startdjangoproject.sh
    source ~/djangotools/startdjangoapp.sh
fi

export PATH=$PATH:/var/lib/gems/1.8/bin

source .`uname`_zshrc
