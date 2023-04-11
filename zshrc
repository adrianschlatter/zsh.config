# powerlevel10k:
source ~/.config/zsh/powerlevel10k/powerlevel10k.zsh-theme
source ~/.config/zsh/zshrc.powerlevel10k

# Aliases
# ============================================================================= 

alias ll='ls -alF'
alias ls='ls --color'

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

autoload -Uz compinit; compinit; _comp_options+=(globdots)
