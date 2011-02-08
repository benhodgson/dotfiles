alias ll='ls -l'
alias rmpyc="find . -name '*.pyc' -exec rm {} \;"

export PYTHONSTARTUP=$HOME/.pythonrc
export EDITOR='mate -w'
export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegxedabagacad

# Prompt:
PS1="[\u:\w] → "

# Quick access to projects
PROJECTS_DIR=$HOME/projects
function project {
    cd $PROJECTS_DIR/"$1"/
    cd "$1" > /dev/null 2>&1 && source ../bin/activate > /dev/null 2>&1;
}
complete -W '`ls $PROJECTS_DIR`' project # OMFG command completion

export PATH=$PATH:/usr/local/mysql/bin/
