
pathadd() {
    if [[ ":$PATH:" != *":$1:"* ]]; then
        PATH="${PATH:+"$PATH:"}$1"
    fi
}
pathadd "~/bin"

#echo " Welcome corporate rat"
#echo "         .~.    "
#echo "         /V\    "
#echo "        // \\\\    "
#echo "       /(   )\    "
#echo "        ^\`~'^    "
#echo


#Other
#=====
# Orange
# PS1='\[\e[1;35m\]\u@\h\[\e[m\] \[\e[1;34m\]\w \[\e[1;37m\]'

# Purple
# PS1="\[\033[38;5;215m\]\u@\h \[$(tput sgr0)\]\[\033[38;5;12m\]\w \[$(tput sgr0)\]"


alias ls="ls --color"
alias l="ls -alh"
alias ll="ls -alh"
alias lls="ls -lh --color"
alias cd..="cd .."
alias lsf="ls -al | grep"
alias psf="ps -A | grep"

# easy find
findfunction() {
  find 2>/dev/null -L -iname "*$1*" ${@:2}
}
alias findn=findfunction

# same installation commands
if [ -e /etc/yum.conf ] ; then
    alias ainstall="sudo yum install"
    alias areinstall="sudo yum reinstall"
    alias aremove="sudo yum remove"
    alias asearch="sudo yum search"
    alias ashow="sudo yum info"
    alias alistall="sudo yum installed"
    alias update="sudo yum update"
    alias upgrade="sudo yum update"
fi
if [ -e /etc/pacman.config ] ; then
    alias pacman="pacman --color always"
    alias ainstall="sudo pacman --color always -S"
    alias auninstall="sudo pacman --color always -RS"
    alias areinstall="sudo pacman --color always -S"
    alias asearch="pacsearch"
    alias ashow="pacman --color always -Si"
    alias ashowfiles="pacman --color always -Qlq"
    alias ashowlocal="pacman --color always -Qi"
    alias alistall="pacman --color always -Q"
    alias update="sudo pacman -Qu"
    alias upgrade="sudo pacman -Syyu"
fi
if [ -d /etc/apt ] ; then
    alias ainstall="sudo apt-get install"
    alias areinstall="sudo apt-get install --reinstall"
    alias aremove="sudo apt-get --purge remove"
    alias asearch="sudo apt-cache search"
    alias ashow="sudo apt-cache show"
    alias alistall="sudo apt --installed list"
    alias update="sudo apt-get update"
    alias upgrade="sudo apt-get upgrade"
    alias uu="update && upgrade"
fi

# supervisord shortucts
alias sreread="sudo supervisorctl reread"
alias supdate="sudo supervisorctl update"
alias sstatus="sudo supervisorctl status"
alias sstart="sudo supervisorctl start"
alias sstop="sudo supervisorctl stop"
alias srestart="sudo supervisorctl restart"
alias stail="sudo supervisorctl tail"
alias staill="sudo supervisorctl tail -8000"
alias stailf="sudo supervisorctl tail -f"
alias sgogo="sudo supervisorctl reread && sudo supervisorctl update && echo --wait-- && sleep 3 && sudo supervisorctl status"

# git shortcuts
alias g="git"
alias gf="git fetch"
alias gs="git s"
alias gg="git g"
alias gb="git branch"
alias gd="git dd"
alias gm="git merge"
alias gc="git commit"
alias gu="git u"
alias git-nossl="git -c http.sslVerify=false"

#dictionary search
alias look="look"
alias f="fuck"
alias c="clear"
alias makev="make SHELL='sh -x'"

alias PI="projectInfo"
alias PIF="projectInfo fetch"
alias PIf="projectInfo fetch"

## set some other defaults ##
alias df="df -hT"
alias du='du -ch'
alias grep='grep --color'
alias less_="less"
alias less="less -r"
alias grep_="grep --color=always"
alias grep="grep --color=always"


alias ..='cd ..'
alias ...='cd ../../'
alias ....='cd ../../../'
alias .....='cd ../../../../'
alias .4='cd ../../../../'
alias .5='cd ../../../../..'


# install  colordiff package :)
alias diff='colordiff'
alias dwdiff='dwdiff -c -L -C3'

#12: Show open ports
alias ports='netstat -tulanp'

#Control WebServer
alias rapache2="sudo service apache2 restart"
alias rsshd="sudo service ssh restart"

# for badly configured servers
alias ssh_nopubkey="ssh -o PubkeyAuthentication=no"


## pass options to free ##
alias meminfo='free -m -l -t'

## get top process eating memory
alias psmem='ps auxf | sort -nr -k 4'
alias psmem10='ps auxf | sort -nr -k 4 | head -10'

alias updateycm='cd ~/.vim/bundle/YouCompleteMe && ./install.py --clang-completer'
alias updateycmall='cd ~/.vim/bundle/YouCompleteMe && ./install.py --clang-completer --gocode-completer --tern-completer --tern-completer'

## get top process eating cpu ##
alias pscpu='ps auxf | sort -nr -k 3'
alias pscpu10='ps auxf | sort -nr -k 3 | head -10'

## Get server cpu info ##
alias cpuinfo='lscpu'

# nice, more readable manual! This is a must
man() {
    env \
    LESS_TERMCAP_mb=$'\e[01;31m' \
    LESS_TERMCAP_md=$'\e[01;38;5;74m' \
    LESS_TERMCAP_me=$'\e[0m' \
    LESS_TERMCAP_se=$'\e[0m' \
    LESS_TERMCAP_so=$'\e[46;30m' \
    LESS_TERMCAP_ue=$'\e[0m' \
    LESS_TERMCAP_us=$'\e[04;38;5;146m' \
    man "$@"
}

alias reveal="nautilus . &"

# load custom promt and commands
if [ -f "$HOME/.promt" ]; then
  . "$HOME/.promt"
fi

# set vi mode
# http://www.catonmat.net/blog/bash-vi-editing-mode-cheat-sheet/
set -o vi


# bind home and end to ESC+insert on ^ and $
# http://stackoverflow.com/questions/4200800/in-bash-how-do-i-bind-a-function-key-to-a-command
# http://www.gnu.org/software/bash/manual/html_node/Bash-Builtins.html
# TODO check if this is still needed
if [ $(hostname) != "ankh" ] ; then 
    bind -m vi-insert '"\e[1~":"\eI"'
    bind -m vi-insert '"\e[4~":"\eA"'
    bind -m vi '"\e[1~":"^"'
    bind -m vi '"\e[4~":"$"'
fi
# page up and page down 
bind -m vi '"\e[5~":"\e[A"'
bind -m vi-insert '"\e[5~":"\e[A"'
bind -m vi '"\e[6~":"\e[B"'
bind -m vi-insert '"\e[6~":"\e[B"'

fsdevice () {
    SCRIPT_USER=$USER
    MACHINE="NONE"
    MOUNT_POINT="$HOME/device"
    PORT=22
    # shift
    while [[ $# -gt 0 ]] ; do
        key="$1"
        # echo "#processing: $key"
        case $key in
            -u|--user)
                SCRIPT_USER="$2"
                shift # past argument
                ;;
            -m|--mount)
                MOUNT_POINT="$2"
                shift # past argument
                ;;
            -p|--port)
                PORT="$2"
                shift # past argument
                ;;
            *)
                MACHINE=$1
                ;;
        esac
        shift # past argument or value
    done
    if [ $MACHINE = "NONE" ] ; then echo "missing target machine" ; return 1 ; fi
    mkdir -p $MOUNT_POINT 2>/dev/null
    # echo ARGS: $MACHINE , $MOUNT_POINT , $SCRIPT_USER , $PORT
    sudo fusermount -zu $MOUNT_POINT
    sudo sshfs ${SCRIPT_USER}@${MACHINE}:/ -p $PORT $MOUNT_POINT -C -o allow_other
    echo "Mounted ${SCRIPT_USER}@${MACHINE}:/ at $MOUNT_POINT"
}

fsroot () {
  fsdevice -u root $*
}

#select best editor
if hash nvim 2>/dev/null; then
    export EDITOR=nvim
    export SUDO_EDITOR=nvim
    export GIT_EDITOR=nvim
    # fix Ctrl+H for neovim + tmux
    infocmp $TERM | sed 's/kbs=^[hH]/kbs=\\177/' > ~/$TERM.ti ; tic ~/$TERM.ti
    alias vim="nvim"
elif hash vim 2>/dev/null; then
    export EDITOR=vim
    export SUDO_EDITOR=vim
    export GIT_EDITOR=vim
else
    export EDITOR=vi
    export SUDO_EDITOR=vi
    export GIT_EDITOR=vi
    alias vim="vi"
fi

