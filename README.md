# my zsh config

This is my personal zsh config.

## Installation instructions

```
git clone git@github.com:adrianschlatter/zsh.config.git ~/.config/zsh
git clone https://github.com/romkatv/powerlevel10k.git ~/.config/zsh/powerlevel10k
cp ~/.config/zsh/dotzshrc ~/.zshrc
```

If conda is needed, also run:

```
<path_to_conda>/conda init zsh
```

This will modify .zshrc. As the conda path and other things depend on the
installation at hand, this is probably the right thing to do. Including the
conda snippet in this repository would not (generally) work.
