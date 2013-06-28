alias ll='ls -l'
alias smtpdebug='python -m smtpd -n -c DebuggingServer localhost:1025'
alias rmpyc="find . -name '*.pyc' -exec rm {} \;"
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias grep='grep --color=auto'
alias urldecode='pawk "urllib.unquote(l)"'
alias serve80='sudo twistd -n web --path . --port 80'

function inflate {
    for f in "$@";
    do
        echo "$f" 1>&2
        python -c "import zlib,sys;sys.stdout.write(zlib.decompress(sys.stdin.read()))" < $f
        if [ $? -ne 0 ]; then return 1; fi
    done
}

export PYTHONSTARTUP=$HOME/.pythonrc.py
export EDITOR='mate -w'
export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegxedabagacad
export HISTCONTROL=erasedups
export HISTSIZE=10000
shopt -s histappend

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
    if [ -d .git ]; then
        git status
    fi
}
complete -W '`ls $PROJECTS_DIR`' project # OMFG command completion

# Homebrew bash completion
if [ -f `brew --prefix`/etc/bash_completion ]; then
    source `brew --prefix`/etc/bash_completion
fi

# Add Homebrew and MySQL bin directories to $PATH
export PATH=$PATH:/usr/local/sbin:/usr/local/mysql/bin:$HOME/sbin
