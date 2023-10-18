# my zsh config

This is my personal zsh config.

## Installation instructions

```
git clone git@github.com:adrianschlatter/zsh.config.git ~/.config/zsh
git clone https://github.com/romkatv/powerlevel10k.git ~/.config/zsh/powerlevel10k
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.config/zsh/zsh-syntax-highlighting
git clone https://github.com/catppuccin/zsh-syntax-highlighting.git ~/.config/zsh/catppuccin
cp ~/.config/zsh/dotzshrc ~/.zshrc
```

Furthermore, this config unfolds its full potential if you have installed:

* exa (better ls)
* bat (better cat)
* bitwarden cli (acces to your password vault)
* ssh-agent (ssh-keys added using passphrases from bitwarden)
* nvim (the editor)

If you need conda, also run:

```
<path_to_conda>/conda init zsh
```

This will modify .zshrc. As the conda path and other things depend on the
installation at hand, this is probably the right thing to do. Including the
conda snippet in this repository would not (generally) work.


## Background

* powerlevel10k provides a powerful prompt including status info on various things.
* zsh-syntax-highlighting provides syntax highlighting for zsh
    - and catppuccin is the theme to use for syntax highlighting
