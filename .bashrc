alias allopsmn="ssh sunicomb@allo-psmn.ens-lyon.fr"
alias psmnjump="ssh -J sunicomb@ssh.psmn.ens-lyon.fr sunicomb@allo-psmn.ens-lyon.fr"
alias sshpsmn="ssh sunicomb@ssh.psmn.ens-lyon.fr"

#alias g++="g++-8" # not enough to comment out, have to rune "unalias g++"

alias ll="ls -alhF"

alias pip=/usr/local/bin/pip3

export BYOBU_PREFIX="/usr/local"
alias byobu="BYOBU_PYTHON=/usr/bin/python byobu"

hgrep ()
{
  if [ "$#" -eq 1 ]; then
    history | grep "$1" | tail -10
  else
    history | grep "$1" | tail -"$2"
  fi
}

if [[ $COLORTERM = gnome-* && $TERM = xterm ]] && infocmp gnome-256color >/dev/null 2>&1; then
  export TERM='gnome-256color';
elif infocmp xterm-256color >/dev/null 2>&1; then
  export TERM='xterm-256color';
fi;

# solarized colors from http://git.io/solarized-colors
if tput setaf 1 &> /dev/null; then
  tput sgr0;
  bold=$(tput bold);
  reset=$(tput sgr0);
  nameblue=$(tput setaf 014);
  pathblue=$(tput setaf 189);
  white=$(tput setaf 15);
else
  bold='';
  reset="\e[0m";
  nameblue="\e[1;37m";
  pathblue="\e[1;37m";
  white="\e[1;37m";
fi;

# set colours
LSCOLORS=GxFxCxDxBxegedabagaced
export LSCOLORS

# set the terminal title and prompt.
PS1="\[\033]0;\W\007\]"; # working directory base name
PS1+="\[${nameblue}\]\u"; # username
PS1+="\[${white}\]@";
PS1+="\[${pathblue}\]\w"; # working directory full path
PS1+="\[${white}\]\$ \[${reset}\]"; # `$` (and reset color)
export PS1;

PS2="\[${yellow}\]→ \[${reset}\]";
export PS2;

HISTFILESIZE=100000
HISTSIZE=100000

export HISTCONTROL=ignoreboth:erasedups

# brew completion
if which brew >/dev/null 2>&1; then
  if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
  fi

  if [ -f $(brew --prefix)/Library/Contributions/brew_bash_completion.sh ]; then
    . $(brew --prefix)/Library/Contributions/brew_bash_completion.sh
  fi
fi
