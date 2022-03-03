# Install

First, clone the repository:

```zsh
git clone https://github.com/kalsowerus/zsh-theme.git ~/.oh-my-zsh/custom/themes/kalsowerus
```

## Manual installation

Create the symlink:

```zsh
ln -s $ZSH/custom/themes/kalsowerus/kalsowerus.zsh-theme $ZSH/custom/themes/kalsowerus.zsh-theme
```

And then update your `ZSH_THEME` in your `.zshrc` like this:

```zsh
ZSH_THEME="kalsowerus"
```

**Warning the following install script will create a new `.zshrc`. Do not execute it if you already modified your `.zshrc`.**

## Installation script

Run the install script, this will create a new `.zshrc` and install a few plugins:

```zsh
~/.oh-my-zsh/custom/themes/kalsowerus/install.sh
```

