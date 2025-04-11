#plugins=(colorize command-not-found cp zoxide)
#plugins=(zsh-autosuggestions)
#source ~/.zshrc

source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#8DFBD2,bold"
ZSH_AUTOSUGGEST_STRATEGY=(history completion)
bindkey '^I' autosuggest-accept

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
#setopt BASH_AUTO_LIST NO_AUTOLIST NO_MENU_COMPLETE
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
