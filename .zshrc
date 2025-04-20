#plugins=(colorize command-not-found cp zoxide)
#plugins=(zsh-autosuggestions eza fzf yazi gh)
#source ~/.zshrc


# default apps
export EDITOR="nvim"
export VISUAL="nvim"
export TERMINAL="kitty"
export BROWSER="firefox"

# default folders
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_SCREENSHOTS_DIR="$HOME/Pictures/screenshots"

# tab autocompletions
autoload -Uz compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
_comp_options+=(globdots)
compinit -d $XDG_CACHE_HOME/zsh/zcompdump-$ZSH_VERSION

# use vim keys in tab complete menu
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char

# history
export HISTSIZE=100000
export SAVEHIST=20000
export HISTFILE="$HOME/.zsh_sessions/history"
setopt hist_ignore_dups     # do not record an event that was just recorded again
setopt hist_ignore_all_dups # delete an old recorded event if a new event is a duplicate
setopt hist_ignore_space    # do not record an event starting with a space
setopt hist_save_no_dups    # do not write a duplicate event to the history file
setopt inc_append_history   # write to the history file immediately, not when the shell exits
setopt share_history        # share history between terminals

# fzf in terminal, fzf must be installed to use this
eval "$(fzf --zsh)"

# change word selection to exclude slashes
autoload -U select-word-style
select-word-style bash

source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#FFAAAA,bold"
ZSH_AUTOSUGGEST_STRATEGY=(history completion)

# bindkey '^I' autosuggest-accept

# enable Vim mode
bindkey -v


# 8DFBD2

#zstyle ':prezto:module:prompt' theme 'statusline'

export PATH="$PATH:/usr/local/share/dotnet"

HIST_STAMPS="yyyy-mm-dd"

# You may need to manually set your language environment
export LANG=en_US.UTF-8
#export LC_ALL=zh_TW.UTF-8
#export LANG=zh_TW.UTF-8
set encording=UTF-8

#Git aliases
alias gs='git status'
alias ga='git add'
alias gaa='git add .'
alias commit='git commit -m'
alias gcc='git checkout'
alias gcb='git checkout -b'
alias gb='git branch'
alias gl='git log --oneline'
alias lg='git log'
alias gg='git log --graph --pretty=format:"%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr)"'
alias clone='git clone'
alias push='git push'
alias pull='git pull'
alias merge='git merge'
alias gd='git diff'

alias h='history'
alias c='clear'
alias tree='tree --dirsfirst -F'
alias mkdir='mkdir -p -v'

alias ls='eza --icons=always --color=always'
alias lst='eza --icons=always --color=always -s modified'

alias ll='eza -lhB --icons=always --color=always --git-repos'
alias llt='eza -lhB --icons=always --color=always -s modified --git-repos'

alias la='eza -lhBa --icons=always --color=always --git-repos'
alias lat='eza -lhBa --icons=always --color=always -s modified --git-repos'

alias man='(man $1 || tldr $1) 2>/dev/null'

#Directory aliases
alias vvv='cd ~/Documents/Git/vsc'
alias vvj='cd ~/Documents/Git/java'
alias vvb='cd ~/Documents/Git/bash'
alias vvo='cd ~/Documents/Git/Obsidian'
alias vvs='cd ~/Documents/Git/SQL'
alias vvg='cd ~/Documents/Git'
alias vvp='cd ~/Documents/Git/python'

alias v='nvim'
alias vim='nvim'


# tab completion
setopt BASH_AUTO_LIST AUTOLIST AUTOMENU # enable autolist
#setopt BASH_AUTO_LIST NO_AUTOLIST NO_MENU_COMPLETE #disable autolist
#setopt +o menucomplete
#setopt +o automenu

#Move to CWD When Exiting Yazi
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='nvim'
# fi

eval "$(zoxide init zsh)"
eval "$(starship init zsh)"
