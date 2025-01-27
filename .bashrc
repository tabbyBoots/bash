HISTTIMEFORMAT="%F %T "
HISTCONTROL=ignoredups

HISTSIZE=2000
HISTFILESIZE=2000

shopt -s histappend

blk='\[\033[01;30m\]'   # Black
red='\[\033[01;31m\]'   # Red
grn='\[\033[01;32m\]'   # Green
ylw='\[\033[01;33m\]'   # Yellow
blu='\[\033[01;34m\]'   # Blue
pur='\[\033[01;35m\]'   # Purple
cyn='\[\033[01;36m\]'   # Cyan
wht='\[\033[01;37m\]'   # White
clr='\[\033[00m\]'      # Reset

set -o vi

#Git aliases
alias gs='git status'
alias ga='git add'
alias gaa='git add .'
alias commit='git commit -m $2'
alias gcc='git checkout'
alias gl='git log --oneline'
alias lg='git log'
alias gg='git log --graph --pretty=format:"%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr)"'
alias gb='git checkout -b'
alias gd='git diff'
alias clone='git clone'
alias push='git push'
alias pull='git pull'
alias merge='git merge'
alias gb='git branch'

alias h='history'
alias c='clear'
alias tree='tree --dirsfirst -F'
alias mkdir='mkdir -p -v'
alias la='ls -al --sort=size'
alias ll='ls -l --sort=time'

#Directory aliases
alias vv='cd /e/Meng文件區/VSC2022'

# Display the current Git branch in the Bash prompt.

function git_branch() {
    if [ -d .git ] ; then
        printf "%s" "($(git branch 2> /dev/null | awk '/\*/{print $2}'))";
    fi
}

# Set the prompt.

function bash_prompt(){
    PS1='${debian_chroot:+($debian_chroot)}'${blu}'$(git_branch)'${pur}' \W'${grn}' \$ '${clr}
}

bash_prompt
