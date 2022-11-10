# R interpreter throws warning if these aren't set, run $locales
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

alias allopsmn="ssh sunicomb@allo-psmn.ens-lyon.fr"
alias psmnjump="ssh -J sunicomb@ssh.psmn.ens-lyon.fr sunicomb@allo-psmn.ens-lyon.fr"
alias sshpsmn="ssh sunicomb@ssh.psmn.ens-lyon.fr"
#ssh sunicomb@kay.ichec.ie
alias pip=/usr/local/bin/pip3
alias tac="tail -r"

export BYOBU_PREFIX="/usr/local"

alias byobu="BYOBU_PYTHON=/usr/bin/python byobu"

alias g="gnuplot"
alias p="python"
alias v="vim"

alias rrscript="Rscript"

#alias g++="g++-8" # must unalias too

hgrep ()
{
  if [ "$#" -eq 1 ]; then
    history | grep "$1" | tail -10
  else
    history | grep "$1" | tail -"$2"
  fi
}

wordle ()
{
  FILE="wordle.dat"

  if [ -f "$FILE" ]
  then
    AVG=$(cat "$FILE" | awk '{if (NR % 2 == 1) {c = $1} else {f = $1; t += $1; s += c * f}} END {print s / t}')

    echo "average wordle score is $AVG, do better"
  else
    echo "$FILE is not in this directory"
  fi
}

function validate_url()
{
  if [[ `wget -S --spider $1  2>&1 | grep 'HTTP/1.1 200 OK'` ]]; then wget $i; fi
}

if [[ $COLORTERM = gnome-* && $TERM = xterm ]] && infocmp gnome-256color >/dev/null 2>&1; then
  export TERM='gnome-256color';
elif infocmp xterm-256color >/dev/null 2>&1; then
  export TERM='xterm-256color';
fi;

if tput setaf 1 &> /dev/null; then
  tput sgr0;
  bold=$(tput bold);
  reset=$(tput sgr0);
  nameblue=$(tput setaf 147);
  pathblue=$(tput setaf 147);
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

# set the prompt
PS1="\[\033]0;\W\007\]";            # working directory base name
PS1+="\[${nameblue}\]\u";           # username
PS1+="\[${white}\]@";               # ampersand
PS1+="\[${pathblue}\]\w";           # working directory full path
PS1+="\[${white}\]\$ \[${reset}\]"; # dollar sign and reset color
export PS1;

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
