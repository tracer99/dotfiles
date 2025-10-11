#needed for 1password integration in WSL
if [ -f "/etc/wsl.conf" ]; then
	alias ssh='ssh.exe'
	alias ssh-add='ssh-add.exe'
fi

if [ "$TERM" != "dumb" ]; then
    eval "`dircolors -b`"
    alias ls='ls --color=auto'
    #alias dir='ls --color=auto --format=vertical'
    #alias vdir='ls --color=auto --format=long'
fi

# some more ls aliases
#alias ll='ls -l'
#alias la='ls -A'
alias l='ls -al'

