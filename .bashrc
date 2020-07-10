alias allopsmn="ssh sunicomb@allo-psmn.ens-lyon.fr"
alias psmnjump="ssh -J sunicomb@ssh.psmn.ens-lyon.fr sunicomb@allo-psmn.ens-lyon.fr"
alias sshpsmn="ssh sunicomb@ssh.psmn.ens-lyon.fr"

alias g++="g++-8"

alias ll="ls -alhF"

export BYOBU_PREFIX="/usr/local"
alias byobu="BYOBU_PYTHON=/usr/bin/python byobu"

hgrep ()
{
  history | grep "$1" | tail -10
}

if [[ $COLORTERM = gnome-* && $TERM = xterm ]] && infocmp gnome-256color >/dev/null 2>&1; then
  export TERM='gnome-256color';
elif infocmp xterm-256color >/dev/null 2>&1; then
  export TERM='xterm-256color';
fi;

if tput setaf 1 &> /dev/null; then
  tput sgr0; # reset colors
  bold=$(tput bold);
  reset=$(tput sgr0);
  # Solarized colors, taken from http://git.io/solarized-colors.
  black=$(tput setaf 0);
  blue=$(tput setaf 33);
  cyan=$(tput setaf 37);
  green=$(tput setaf 64);
  orange=$(tput setaf 166);
  purple=$(tput setaf 125);
  red=$(tput setaf 124);
  violet=$(tput setaf 61);
  white=$(tput setaf 15);
  yellow=$(tput setaf 136);
else
  bold='';
  reset="\e[0m";
  black="\e[1;30m";
  blue="\e[1;34m";
  cyan="\e[1;36m";
  green="\e[1;32m";
  orange="\e[1;33m";
  purple="\e[1;35m";
  red="\e[1;31m";
  violet="\e[1;35m";
  white="\e[1;37m";
  yellow="\e[1;33m";
fi;

# Highlight the user name when logged in as root.
if [[ "${USER}" == "root" ]]; then
  userStyle="${red}";
else
  userStyle="${orange}";
fi;

# Highlight the hostname when connected via SSH.
if [[ "${SSH_TTY}" ]]; then
  hostStyle="${bold}${red}";
else
  hostStyle="${yellow}";
fi;

# Set the terminal title and prompt.
PS1="\[\033]0;\W\007\]"; # working directory base name
PS1+="\[${userStyle}\]\u"; # username
PS1+="\[${white}\]@";
PS1+="\[${hostStyle}\]\h"; # host
PS1+="\[${white}\]:";
PS1+="\[${green}\]\w"; # working directory full path
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


alias pip=/usr/local/bin/pip3
