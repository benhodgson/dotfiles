"""
Python Startup File (from https://gist.github.com/955154)

Add this file to ~/.pythonrc.py to add history between sessions and
auto-completion via the TAB key to the interactive Python interpreter. After
adding this file, put something like the following line in your .bash_profile:

    export PYTHONSTARTUP=$HOME/.pythonrc.py

Requires a recent version of Python and the readline package, which you can
install from http://pypi.python.org/pypi/readline or with easy_install.

    easy_install -U readline

"""

def _pythonrc():
    
    import atexit
    import os
    import readline
    import rlcompleter
    
    if 'libedit' in readline.__doc__:
        readline.parse_and_bind("bind ^I rl_complete")
    else:
        readline.parse_and_bind("tab: complete")
    
    history = os.path.expanduser("~/.py_history")
    readline.set_history_length(500)
    if os.path.exists(history):
        readline.read_history_file(history)
    
    @atexit.register
    def write_history(history=history):
        readline.write_history_file(history)


_pythonrc()

del _pythonrc
