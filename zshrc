# powerlevel10k:
source ~/.config/zsh/powerlevel10k/powerlevel10k.zsh-theme
source ~/.config/zsh/zshrc.powerlevel10k


alias ll='ls -alF'
alias ls='ls --color=auto'

alias gls='git status'
alias grep='grep --color=auto'

eval "$(ssh-agent -s)" > /dev/null

# Load Git completion
zstyle ':completion:*:*:git:*' script ~/.config/zsh/git-completion.bash
fpath=(~/.config/zsh $fpath)

autoload -Uz compinit; compinit; _comp_options+=(globdots)
