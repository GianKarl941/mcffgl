# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# kitty terminal
export PATH=$PATH:~/.local/kitty.app/bin

# rust's cargo repository 
export PATH=$PATH:/root/.cargo/bin

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth
# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
        PS1="\[\033[01;31m\]🏴┏━\[\033[01;04;31m\][🔶\u🔶]\[\033[01;00m\]\[\033[01;31m\]\n😀┃\n  \[\033[01;33m\]├[◇◆\h◆◇]\[\033[01;32m\]\n  │\n  ├[§\w§]\[\033[01;05;00m\] \n  └─ → \$ "
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'
    alias l='l -lah --colot=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# My custom alias for daily use

alias wttr='wget -O- -q wttr.in/?0'

alias wttr-half='wget -O- -q wttr.in/?n'

alias wttr-h='curl wttr.in/:help'
alias getnews='curl ph.getnews.tech'

# Uncomment this if you prefer wget or you don't have curl installed
# alias wgettr='wget -O- -q wttr.in/?format=4'
 
alias exal='exa -lTahL=1'
alias exatl='exa -TahL=1'

alias ls-cmd-app='cat ~/Documents/cmdline_applications/ls-cmd-app.txt '
alias dlinks2="links2 www.duckduckgo.com"
alias stlinks2='links2 https://www.startpage.com/do/mypage.pl?prfe=cc80c98e377ff9293e5e92f259f73e14e17f3992de94bd87debb0a590ebfaff008da3f6e888703f8566254e5a2a74cdf036e57c84b4bfbab1954d7b84b6d139b3f0372031193a54c01b0680ab1'

alias feh='setsid -f feh'
alias libreoffice='setsid -f libreoffice'
alias zathura='setsid -f zathura'

alias notes='cd ~/Documents/Notes_in_markdown && vim -c "set syntax=markdown"'
alias vim='vim -c "colorscheme gruvbox"'

alias youtube-dl-video='youtube-dl --write-sub --write-all-thumbnails -f bestvideo+bestaudio'
alias youtube-dl-music='youtube-dl -x --audio-format flac'
##################
#Startup commands#
##################

# Change the key repeat settings
xset r rate 280 55

# Greetings

./bash_programs/ASCII.sh 

# force change colorscheme

./.vim/plugged/gruvbox/gruvbox_256palette.sh

# Powerline-shell
# 
#function _update_ps1() {
#    PS1=$(powerline-shell $?)
#}

#if [[ $TERM != linux && ! $PROMPT_COMMAND =~ _update_ps1 ]]; then
#    PROMPT_COMMAND="_update_ps1; $PROMPT_COMMAND"
#fi

