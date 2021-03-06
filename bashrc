
# Note: PS1 and umask are already set in /etc/profile. You should not
# need this unless you want different defaults for root.
# PS1='${debian_chroot:+($debian_chroot)}\h:\w\$ '
# umask 022

# You may uncomment the following lines if you want `ls' to be colorized:
export LS_OPTIONS='--color=auto'
if [ "$MSYSTEM" ]; then
    SHELL=$SHELL # for some reason, MSYS bash doesn't set the SHELL variable even though $SHELL returns a value
    export LS_OPTIONS='' # MSYS bash colors are hard to see, so disabling for now
fi
eval "`dircolors -b`" # default to bash colors

alias ls='ls $LS_OPTIONS'
alias ll='ls $LS_OPTIONS -l'
alias l='ls $LS_OPTIONS -lA'
#
# Some more alias to avoid making mistakes:
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

if [ "$MSYSTEM" ]; then # on Windows w/ MSYS
    export MSYS_HOME=/c/msys
    export WORKON_HOME=/c/MSYS/home/ashnayder/.virtualenvs
    if [ -e /c/Users/ashnayder/AppData/Local/Programs/Python/Python35-32/Scripts/virtualenvwrapper.sh ]; then
        source /c/Users/ashnayder/AppData/Local/Programs/Python/Python35-32/Scripts/virtualenvwrapper.sh
    elif [ -e /c/Python35/Scripts/virtualenvwrapper.sh ]; then
	source /c/Python35/Scripts/virtualenvwrapper.sh
    fi
    export PATH="$PATH:/c/Program Files/Git/usr/bin"
else # on Linux
    export WORKON_HOME=$HOME/.virtualenvs
    export PROJECT_HOME=$HOME/Devel
    source /usr/local/bin/virtualenvwrapper.sh
fi

if [ "$TERM" == "xterm" ]; then
	export TERM=xterm-256color
fi

# Deactive terminal flow-control commands (ex. CTRL-S should not disable updating output of terminal)
stty ixany 
stty ixoff -ixon

#---------------------------------------------------------------------------------------
# Run ssh-agent (if it isn't already running) so you can commit to GitHub automatically
#---------------------------------------------------------------------------------------
# Note: ~/.ssh/environment should not be used, as it
#       already has a different purpose in SSH.

env=~/.ssh/agent.env

# Note: Don't bother checking SSH_AGENT_PID. It's not used
#       by SSH itself, and it might even be incorrect
#       (for example, when using agent-forwarding over SSH).

agent_is_running() {
    if [ "$SSH_AUTH_SOCK" ]; then
        # ssh-add returns:
        #   0 = agent running, has keys
        #   1 = agent running, no keys
        #   2 = agent not running
        ssh-add -l >/dev/null 2>&1 || [ $? -eq 1 ]
    else
        false
    fi
}

agent_has_keys() {
    ssh-add -l >/dev/null 2>&1
}

agent_load_env() {
    . "$env" >/dev/null
}

agent_start() {
    (umask 077; ssh-agent >"$env")
    . "$env" >/dev/null
}

if ! agent_is_running; then
    agent_load_env
fi

# if your keys are not stored in ~/.ssh/id_rsa or ~/.ssh/id_dsa, you'll need
# to paste the proper path after ssh-add
if ! agent_is_running; then
    agent_start
    ssh-add
elif ! agent_has_keys; then
    ssh-add
fi

unset env

#---------------------------------------------------------------------------------------
# End ssh-agent code
#---------------------------------------------------------------------------------------
