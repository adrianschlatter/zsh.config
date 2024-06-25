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

if command -v nvim > /dev/null; then
	alias vi='nvim'
  export EDITOR=$(command -v nvim)
fi

alias gls='git status'
alias grep='grep --color=auto'

# Use rbw (bitwarden cli) for sudo and ssh passwords
# =============================================================================

if command -v rbw > /dev/null; then
    # sudo -A will use bitwarden to look up password based on username
    # sudo asks for and host the command is executed on:
    export SUDO_ASKPASS="${HOME}/.config/zsh/askpass_sudo"

    export SSH_ASKPASS=~/.config/zsh/askpass_ssh
    export SSH_ASKPASS_REQUIRE=force
fi

# MOSH
# =============================================================================

# fixes locale problem on MacOS:
if [[ "$OSTYPE" == "darwin"* ]]
then
	export LANG=en_US.UTF-8
	export LC_CTYPE=en_US.UTF-8
fi

# OPEN-AI Key for mods:
#==============================================================================

[[ -f ~/.OPENAI_API_KEY ]] && export OPENAI_API_KEY=$(cat ~/.OPENAI_API_KEY)

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

# 'timew-tagrename <oldtag> <newtag> <fromdate> <todate>
function timew-tagrename()
{
	local oldtag=$1; shift
	local newtag=$1; shift
    local from=$1; shift
    local to=$1; shift
	local idlist=$(timew summary $from - $to "$oldtag" :ids |\
	               sed -nr 's/.* (@[0-9]+) .*/\1/p')
	echo "$idlist" | xargs -I ids timew tag ids "$newtag"
	echo "$idlist" | xargs -I ids timew untag ids "$oldtag"
}

# emacs mode
# =============================================================================

# Sometimes something (tmux?) switches zsh to vi mode.
# Make sure it's in emacs mode:

bindkey -e

# add command-line editing feature and shortcut:
autoload edit-command-line
zle -N edit-command-line
bindkey '^Xe' edit-command-line


# catppuccin syntax-highlighting theme
# (must be last in this config file)
# ============================================================================= 

source ~/.config/zsh/catppuccin/themes/catppuccin_macchiato-zsh-syntax-highlighting.zsh
source ~/.config/zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

