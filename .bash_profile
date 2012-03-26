shopt -s histappend

alias ll='ls -l'
alias smtpdebug='python -m smtpd -n -c DebuggingServer localhost:1025'
alias rmpyc="find . -name '*.pyc' -exec rm {} \;"

export PYTHONSTARTUP=$HOME/.pythonrc.py
export EDITOR='mate -w'
export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegxedabagacad

# virtualenvwrapper
export WORKON_HOME=$HOME/.virtualenvs
source /usr/local/bin/virtualenvwrapper.sh

# Prompt:
PS1="[\u:\w] → "

# Quick access to projects
PROJECTS_DIR=$HOME/projects
function project {
    cd $PROJECTS_DIR/"$1"/
    cd "$1" > /dev/null 2>&1 && source ../bin/activate > /dev/null 2>&1;
}
complete -W '`ls $PROJECTS_DIR`' project # OMFG command completion

# Add Homebrew and MySQL bin directories to $PATH
export PATH=$PATH:/usr/local/sbin/:/usr/local/mysql/bin/:$HOME/sbin
