# Go Home
# ============================================================================= 

cd ~

# PATH
# ============================================================================= 

path=(~/.local/bin $path)

# POWERLEVEL10K
# ============================================================================= 

source ~/.config/zsh/powerlevel10k/powerlevel10k.zsh-theme
source ~/.config/zsh/zshrc.powerlevel10k

# Aliases
# ============================================================================= 

if command -v exa > /dev/null; then
	alias ls='exa --icons'
	alias ll='exa -alh'
	alias l='exa -lh'
	alias tree='exa --tree'
else
	alias ls='ls --color'
	alias ll='ls -alh'
	alias l='ls -lh'
fi

if command -v bat > /dev/null; then
	alias cat='bat'
	export BAT_THEME=zenburn
elif command -v batcat > /dev/null; then
	alias cat='batcat'
fi

alias gls='git status'
alias grep='grep --color=auto'

# SSH
# =============================================================================

# If it is not running yet, start ssh-agent:
if [ -z "${SSH_AUTH_SOCK+1}" ]; then
	eval "$(ssh-agent -s)" > /dev/null
fi

# If on MacOS, add ssh keys. Use keychain to obtain key passwords:
if [[ "$OSTYPE" == "darwin"* ]]
then
	ssh-add -A &> /dev/null
fi

# MOSH
# =============================================================================

# fixes locale problem on MacOS:
if [[ "$OSTYPE" == "darwin"* ]]
then
	export LANG=en_US.UTF-8
	export LC_CTYPE=en_US.UTF-8
fi

# Git INTEGRATION
#==============================================================================

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
source ~/.config/zsh/completion/timewarrior.zsh

# zoxide
# =============================================================================

if command -v zoxide > /dev/null; then
	eval "$(zoxide init zsh)"
	if whence -w cd | grep 'alias' > /dev/null; then
		unalias cd > /dev/null
	fi
	alias cd='z'
fi

# timew
# =============================================================================

# 'timew-tagrename <oldtag> <newtag>'
function timew-tagrename()
{
	local oldtag=$1; shift
	local newtag=$1; shift
	local idlist=$(timew summary 1970W01 - now "$oldtag" :ids |\
	               sed -nr 's/.* (@[0-9]+) .*/\1/p')
	echo "$idlist" | xargs -I ids timew tag ids "$newtag"
	echo "$idlist" | xargs -I ids timew untag ids "$oldtag"
}

