# IF NOT RUNNING INTERACTIVELY, DO NOTHING
case $- in
    *i*) ;;
      *) return;;
esac


# MORE HISTORY
HISTSIZE=100000
HISTFILESIZE=200000
HISTCONTROL=ignoreboth

# CUSTOM ALIAS
alias grep="grep --color=auto"
alias ls="ls --color=auto -lah"
alias code="flatpak run com.visualstudio.code"


# GLOBAL DEFINITIONS
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# USER SPECIFIC ENVIRONMENTS
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]; then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

PS1='\u:\w\$ '

# CUSTOM ALIAS
alias vim=nvim
alias ls="ls -lah"
alias ps="ps -ef --forest"


# NVIM COPY PASTE
set clipboard+=unnamedplus
export EDITOR="nvim"
export VISUAL="nvim"

# INSTALLS SPECIFICS
