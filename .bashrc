# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines in the history. See bash(1) for more options
export HISTCONTROL=ignoredups

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# Git branch/repo helper for prompt (supports GitButler virtual branches)
__git_prompt() {
    local gitdir
    gitdir=$(git rev-parse --git-dir 2>/dev/null) || return

    local repo
    repo=$(basename "$(git rev-parse --show-toplevel 2>/dev/null)" 2>/dev/null)

    local vb_toml="${gitdir}/gitbutler/virtual_branches.toml"
    if [ -f "$vb_toml" ] \
        && git rev-parse --verify refs/heads/gitbutler/workspace &>/dev/null \
        && grep -q 'in_workspace = true' "$vb_toml"; then
        # GitButler actively managing: show virtual branches in workspace
        local branches
        branches=$(awk '
            /^.branches\./ && !/\.heads/ { in_ws=0 }
            /in_workspace = true/        { in_ws=1 }
            in_ws && /^..branches\./ && /\.heads../ { want_name=1; next }
            want_name && /^name = / {
                sub(/^name = "/, ""); sub(/"$/, ""); print; want_name=0
            }
        ' "$vb_toml")
        if [ -n "$branches" ]; then
            local joined
            joined=$(echo "$branches" | paste -sd ',' -)
            echo " ${repo}[gb: ${joined}]"
            return
        fi
    fi

    # Standard git: show current branch or detached HEAD
    local branch
    branch=$(git symbolic-ref --short HEAD 2>/dev/null || git rev-parse --short HEAD 2>/dev/null)
    if [ -n "$branch" ]; then
        echo " ${repo}(${branch})"
    fi
}

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
xterm-color|xterm-256color)
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00;33m\]$(__git_prompt)\[\033[00m\]\n\$ '
    ;;
*)
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w$(__git_prompt)\n\$ '
    ;;
esac

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME}: ${PWD/$HOME/~}\007"'
    ;;
*)
    ;;
esac




# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

#if [ -f ~/.bash_aliases ]; then
#    . ~/.bash_aliases
#fi

# enable color support of ls and also add handy aliases
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

# 1password SSH aliases for WSL2
alias ssh='ssh.exe'
alias ssh-add='ssh-add.exe'

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi


export FTP_PASSIVE=1
export PASSIVE_FTP=1
export EDITOR=vim
export SVN_EDITOR=$EDITOR

##

export PATH=$PATH:/usr/local/sbin:/usr/sbin:/sbin
export LAUNCHPAD_CHROME='/mnt/c/Program Files (x86)/Google/Chrome/Application/chrome.exe'
export LAUNCHPAD_FIREFOX='/mnt/c/Program Files/Mozilla Firefox/firefox.exe'

##
export USER=pault #user isn't set in windows, and I need this to match all my other user env code


#export DISPLAY=localhost:0.0

## 

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# pnpm
export PNPM_HOME="/home/pault/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
