# powerlevel10k:
source ~/.config/zsh/powerlevel10k/powerlevel10k.zsh-theme
source ~/.config/zsh/zshrc.powerlevel10k

# Aliases
# ============================================================================= 

if command -v exa > /dev/null; then
	alias ls='exa --icons'
	alias ll='exa -alh'
	alias tree='exa --tree'
else
	alias ls='ls --color'
	alias ll='ls -alh'
fi

if command -v bat > /dev/null; then
	alias cat='bat'
elif command -v batcat > /dev/null; then
	alias cat='batcat'
fi

alias gls='git status'
alias grep='grep --color=auto'

# SSH
# =============================================================================

eval "$(ssh-agent -s)" > /dev/null

# If on MacOS, add ssh keys. Use keychain to obtain key passwords:
if [[ "$OSTYPE" == "darwin"* ]]
then
	ssh-add -A &> /dev/null
fi

# Git INTEGRATION
#==============================================================================

zstyle ':completion:*:*:git:*' script ~/.config/zsh/git-completion.bash
fpath=(~/.config/zsh $fpath)
export EDITOR=vi

# HISTORY
# ============================================================================= 

# share history accross multiple zsh sessions:
setopt SHARE_HISTORY

# append to history:
setopt APPEND_HISTORY

# remove blank lines from history:
setopt HIST_REDUCE_BLANKS

HISTFILE=${ZDOTDIR:-$HOME}/.zsh_history
SAVEHIST=5000
HISTSIZE=2000

# completions
# =============================================================================

autoload -Uz compinit; compinit; _comp_options+=(globdots)

# zoxide
# =============================================================================

if command -v zoxide > /dev/null; then
	eval "$(zoxide init zsh)"
	if whence -w cd | grep 'alias'; then
		unalias cd > /dev/null
	fi
	alias cd='z'
fi

