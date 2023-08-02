# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt appendhistory extendedglob
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename "$HOME/.zshrc"

autoload -Uz compinit promptinit
compinit
promptinit

# -U unique (do not add what is already there)
typeset -U path
path=(~/bin $path[@])

pathadd() {
    path=($1 $path[@])
}

pathadd ~/.local/bin


function zsh_erase_history { local HISTSIZE=0; }

export GOPATH="$HOME/go"
export BROWSER="firefox"
export EDITOR="nvim"

# Sway stuff
[ -z "$DISPLAY" ] && export DISPLAY="desktop:0"
[ "$DISPLAY" = ":0" ] && export DISPLAY="desktop:0"
[ "$DESKTOP_SESSION" = "sway" ] && export MOZ_ENABLE_WAYLAND=1

setopt COMPLETE_ALIASES

# add `|' to output redirections in the history
setopt histallowclobber

# use the vi navigation keys (hjkl) besides cursor keys in menu completion
# bindkey -M menuselect 'h' vi-backward-char        # left
# bindkey -M menuselect 'k' vi-up-line-or-history   # up
# bindkey -M menuselect 'l' vi-forward-char         # right
# bindkey -M menuselect 'j' vi-down-line-or-history # bottom

# vim mode
bindkey -v
# bindkey '\e[3~' delete-char
bindkey '^R' history-incremental-search-backward

bindkey  "^[[H"   beginning-of-line
bindkey  "^[[F"   end-of-line
bindkey  "^[[1~"   beginning-of-line
bindkey  "^[[4~"   end-of-line
bindkey '\e[7~' beginning-of-line
bindkey '\e[8~' end-of-line

bindkey  "^[[3~"   delete-char

# PS1='%F{215}%n@%m%f %F{12}%5~%f '
PS1='%F{215}%n@%m%f %F{12}%(8~|.../%7~|%~)%f '

stty erase "^?"

# print hex value of a number
hex() {
   emulate -L zsh
   if [[ -n "$1" ]]; then
       printf "0x%x\n" $1
   else
       print 'Usage: hex <number-to-convert>'
       return 1
   fi
}

# Better colors for all writable directories
# https://askubuntu.com/questions/466198/how-do-i-change-the-color-for-directories-with-ls-in-the-console
export LS_COLORS=$LS_COLORS:'ow=4;94:'

alias nnn="nnn -dH"
alias ls="ls --color --group-directories-first"
alias l="ls -alh --group-directories-first"
alias ll="ls -lh --group-directories-first"
alias lls="ls -lh --color --group-directories-first"
alias cd..="cd .."
alias lsf="ls -al --group-directories-first | grep -i"
alias psf="ps aux -A | grep -i"
alias psmem="ps aux --sort -rss"
alias grepp="grep -Rnsi"
alias c="clear"
alias ip="ip -color=always"
alias ips="ip -color=always -br a"
alias caps_lock="xdotool key Caps_Lock"

alias g="git"

alias makep="prettyfier make"
alias cmakep="prettyfier cmake"
alias ninjap="prettyfier ninja"

#docker
alias docker_run_mnt='docker run --mount type=bind,source="$(pwd)",target=/mnt -it '


alias idfinit_env=". $HOME/esp/esp-idf/export.sh"
idfsetupproject() {
    . $HOME/esp/esp-idf/export.sh
    idf.py set-target esp32
    idf.py menuconfig
    idf.py build
    ln -s build/compile_commands.json
}
alias idf="prettyfier idf.py -p /dev/ttyUSB0"

findfunction() {
  find 2>/dev/null -L -iname "*$1*" ${@:2}
}
alias findn=findfunction
alias findbig="find ./ -type f -print0 | xargs -0 du | sort -n | tail -n 100 | cut -f2 | xargs -I{} du -sh {}"
alias findbigdir="find ./ -maxdepth 1 -type d -print0 | xargs -0 du --max-depth=1 | sort -n | tail -n 50 | tail -n +1 | cut -f2 | xargs -I{} du -sh {}"

codesizecpp () {
    wc -l `find . -iname "*.hpp" -or -iname "*.cpp" -or -iname "*.h" -or -iname "*.c" -or -iname "*.cc" -or -iname "*.cxx"` | sort -h
}

alias sc="sudo systemctl"
alias scg="systemctl | grep -i "
alias sj="sudo journalctl"
alias sl="sudo journalctl"
alias sjf="sudo journalctl -f"
alias slf="sudo journalctl -f"
alias sju="sudo journalctl -u"
alias slu="sudo journalctl -u"
alias sjuf="sudo journalctl -f -u"
alias sluf="sudo journalctl -f -u"
alias sjfu="sudo journalctl -f -u"
alias slfu="sudo journalctl -f -u"

# export http_proxy="http://194.138.0.11:9400"
# export https_proxy="https://194.138.0.11:9400"
# export ftp_proxy="ftp://194.138.0.11:9400"
# export no_proxy="localhost,127.0.0.1,localaddress,.localdomain.com"

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
if [ -d /etc/apt ] ; then
    alias ainstall="sudo apt install"
    alias areinstall="sudo apt install --reinstall"
    alias aremove="sudo apt-get --purge remove"
    alias asearch="apt search"
    alias ashow="apt show"
    alias alistall="apt --installed list"
    alias update="sudo apt update"
    alias upgrade="sudo apt upgrade"
    alias uu="update && upgrade"
fi
if [ -e /etc/pacman.conf ] ; then
    alias pacman="pacman --color always"
    alias ainstall="sudo pacman --color always -S"
    alias areinstall="sudo pacman --color always -S"
    alias aremove="sudo pacman --color always -R"
    alias asearch="pacman --color always -Ss"
    alias ashow="pacman --color always -Si"
    alias ashowfiles="pacman --color always -Qlq"
    alias ashowlocal="pacman --color always -Qi"
    alias alistall="pacman --color always -Q"
    alias alistallexplicit="pacman --color always -Qqe"
    alias update="sudo pacman --color always -Qu"
    alias upgrade="sudo pacman --color always -Syu"
    alias upgradeforce="sudo pacman --color always -Syyu"
fi
if [ -d /mingw32 ] ; then
    alias pacman="pacman --color always"
    alias ainstall="pacman --color always -S"
    alias areinstall="pacman --color always -S"
    alias aremove="pacman --color always -RS"
    alias asearch="pacsearch"
    alias ashow="pacman --color always -Si"
    alias ashowfiles="pacman --color always -Qlq"
    alias ashowlocal="pacman --color always -Qi"
    alias alistall="pacman --color always -Q"
    alias update="pacman -Qu"
    alias upgrade="pacman -Syyu"
fi


# git shortcuts
alias tiga="tig --all"
alias gf="git fetch"
alias gfa="git fetch --all"
alias gs="git s"
alias gg="git g"
alias git-nossl="git -c http.sslVerify=false"
# alias git-amend-now='GIT_COMMITTER_DATE="LC_ALL=en_US.utf8 date -R" git commit --amend --date "LC_ALL=en_US.utf8 date -R"'
alias git-amend-TARGETDATE='export GIT_COMMITTER_DATE="$TARGETDATE" ; git commit --date "$TARGETDATE" --amend ; export GIT_COMMITTER_DATE=""'
alias git-amend-now='export YESTERDAYEVENING=$(LC_ALL=en_US.utf8 date -R) export GIT_COMMITTER_DATE="$YESTERDAYEVENING" ; git commit --date "$YESTERDAYEVENING" --amend ; export GIT_COMMITTER_DATE=""'
alias git-amend-yesterday='export YESTERDAYEVENING=$(LC_ALL=en_US.utf8 date --date="`echo $(( 18 + $RANDOM % 4 ))`:`echo $(( $RANDOM % 59))` yesterday") ; export GIT_COMMITTER_DATE="$YESTERDAYEVENING" ; git commit --date "$YESTERDAYEVENING" --amend ; export GIT_COMMITTER_DATE=""'


alias torrent="transmission-cli -w ~/torrent/ "

#dictionary search
alias look="look"

alias PI="projectInfo"
alias PIF="projectInfo fetch"
alias PIf="projectInfo fetch"

alias redshiftus="redshift -l 0.236966:-97.734886"
alias redshiftcz="redshift -l 49.194991:16.609631"

## set some other defaults ##
alias df="df -hT"
alias du='du -ch'
alias less_="less"
alias less="less -r"
alias grep='grep --color'
alias grep_="grep --color=never"
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
alias ports='ss -lntup | column -t'
# alias ports='netstat -tulanp'

#Control WebServer
alias rapache2="sudo service apache2 restart"
alias rsshd="sudo service ssh restart"

alias reveal="nautilus . &"

# for badly configured servers
alias ssh_nopubkey="ssh -o PubkeyAuthentication=no"


## pass options to free ##
alias meminfo='free -m -l -t'

## get top process eating memory
alias psmem='ps auxf | sort -nr -k 4'
alias psmem10='ps auxf | sort -nr -k 4 | head -10'

## get top process eating cpu ##
alias pscpu='ps auxf | sort -nr -k 3'
alias pscpu10='ps auxf | sort -nr -k 3 | head -10'

## Get server cpu info ##
alias cpuinfo='lscpu'

alias vimlog='sed -r "s/\x1B\[([0-9];)?([0-9]{1,2}(;[0-9]{1,2})?)?[mGK]//g" | vim -R -c "set filetype=log nowrap" -'

weather() {
curl -s wttr.in/$1
}

weather2() {
curl -s v2d.wttr.in/$1
}


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
export MANWIDTH=${MANWIDTH:-100}

fsdevice () {
    SCRIPT_USER=$USER
    MACHINE="NONE"
    MOUNT_POINT="$HOME/mnt"
    PORT=22
    if [ $# -lt 1 ]; then
        echo "fsdevice -u user -m ./mountpoint -p port machine"
    fi
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
    fusermount -zu $MOUNT_POINT
    # sudo -E sshfs ${SCRIPT_USER}@${MACHINE}:/ -p $PORT $MOUNT_POINT -C -o allow_other \
    # sshfs ${MACHINE}  $MOUNT_POINT -C -o allow_other \
    echo "sshfs -ocache=no,kernel_cache,compression=no,reconnect,Ciphers=arcfour,ssh_command='autossh -M 0' $SCRIPT_USER@$MACHINE $MOUNT_POINT"
    sshfs -ocache=no,kernel_cache,compression=no,reconnect,ssh_command='autossh -M 0' $SCRIPT_USER@$MACHINE $MOUNT_POINT \
    && echo "Mounted ${SCRIPT_USER}@${MACHINE}:/ at $MOUNT_POINT"
}

fsroot () {
  fsdevice -u root $*
}

tmuxf () {
    cd ~/.tmux/resurrect
    rm last
    ln -s `ls | tail -n1` last
    cd -
    tmux
}

#------------------------------------------------------------------------------
# select best editor
if hash vim 2>/dev/null; then
    export EDITOR=vim
    export SUDO_EDITOR=vim
    export GIT_EDITOR=vim
    alias suvim="sudo -E vim"
elif hash nvim 2>/dev/null; then
    export EDITOR=nvim
    export SUDO_EDITOR=nvim
    export GIT_EDITOR=nvim
    # fix Ctrl+H for neovim + tmux
    # infocmp $TERM | sed 's/kbs=^[hH]/kbs=\\177/' > ~/$TERM.ti ; tic ~/$TERM.ti
    alias vim="nvim"
    alias suvim="sudo -E nvim"
else
    export EDITOR=vi
    export SUDO_EDITOR=vi
    export GIT_EDITOR=vi
    alias vim="vi"
    alias suvim="sudo -E vi"
fi

alias wiki="cd ~/cloud/space/source/ ; vim"
alias wwiki="cd ~/cloud/space/siemens/ ; vim"


#------------------------------------------------------------------------------
# FZF

# fd - cd to selected directory
fd() {
  local dir
  dir=$(find ${1:-.} -path '*/\.*' -prune \
                  -o -type d -print 2> /dev/null | fzf +m) &&
  cd "$dir"
}
alias fcd="fd"
alias cdf="fd"

# locate
cf() {
  local file

  file="$(locate -Ai -0 $@ | grep -z -vE '~$' | fzf --read0 -0 -1)"

  if [[ -n $file ]]
  then
     if [[ -d $file ]]
     then cd -- $file else
        cd -- ${file:h}
     fi
  fi
}
alias locatef="cf"

# Modified version where you can press
#   - CTRL-O to open with `open` command,
#   - CTRL-E or Enter key to open with the $EDITOR
#   - anything else, cd to that file
fo() {
  local out file key
  IFS=$'\n' out=$(fzf --query="$1" --exit-0 --expect=ctrl-o,ctrl-e)
  key=$(head -1 <<< "$out")
  file=$(head -2 <<< "$out" | tail -1)
  if [ -n "$file" ]; then
      [ "$key" = ctrl-o ] && open "$file" || [ "$key" = ctrl-e ] && ${EDITOR:-vim} "$file" || cd -- $(dirname "$file")
  fi
}

# Modified version where you can press
#   - CTRL-O to open with `xdg-open` command,
#   - CTRL-E or Enter key to open with the $EDITOR
#   - CTRL-R to get caja for the folder
#   - CTRL-P to print path to file
#   - anything else, cd to that file
ff() {
  local i out file files key
  IFS=$'\n' out=$(fzf --query="$1" --exit-0 --expect=ctrl-o,ctrl-e,ctrl-p,ctrl-r)
  key=$(head -1 <<< "$out")
  file=$(head -2 <<< "$out" | tail -1)
  files=$(tail -$i <<< "$out")

  if [ -n "$file" ]; then
    case $key in
        ctrl-e )
            ${EDITOR:-vim} "$file"
            ;;
        ctrl-p )
            echo "$file"
            ;;
        ctrl-r )
            caja $(dirname "$file") 1>/dev/null 2>/dev/null&
            ;;
        ctrl-o )
            xdg-open "$file"
            ;;
        *)
            cd -- $(dirname "$file")
            ;;

    esac
  fi
}


# fkill - kill process
fkill() {
  local pid
  pid=$(ps -ef | sed 1d | fzf -m | awk '{print $2}')

  if [ "x$pid" != "x" ]
  then
    echo $pid | xargs kill -${1:-9}
  fi
}

# fbr - checkout git branch
fbrl() {
  local branches branch
  branches=$(git branch -vv) &&
  branch=$(echo "$branches" | fzf +m) &&
  git checkout $(echo "$branch" | awk '{print $1}' | sed "s/.* //")
}

# fbr - checkout git branch (including remote branches)
fbr() {
  local branches branch
  branches=$(git branch --all | grep -v HEAD) &&
  branch=$(echo "$branches" |
           fzf-tmux -d $(( 2 + $(wc -l <<< "$branches") )) +m) &&
  git checkout $(echo "$branch" | sed "s/.* //" | sed "s#remotes/[^/]*/##")
}

# Setup cdg function
unalias cdg 2> /dev/null
cdg() {
   local dest_dir=$(cat ~/.cdg_paths | sed "/^\s*$/d" | fzf )
   if [[ $dest_dir != '' ]]; then
      cd "$dest_dir"
   fi
}
# export -f cdg > /dev/null

alias marks="mark -l"

[[ -f ~/.promt ]] && . ~/.promt


if [ -f /usr/share/fzf/completion.zsh ]; then
    source /usr/share/fzf/completion.zsh
    source /usr/share/fzf/key-bindings.zsh
else
    [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
    [ -f ~/.fzf/shell/key-bindings.zsh ] && source ~/.fzf/shell/key-bindings.zsh
fi


