![preview](theme.png)

# Install (Antigen)

In your `.zshrc`:

```zsh
# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Your plugins...

# Load the theme
antigen theme kalsowerus/kalsowerus.zsh-theme

antigen apply
```

Or copy my example `.zshrc`

```zsh
curl https://raw.githubusercontent.com/kalsowerus/kalsowerus.zsh-theme/master/antigen.zshrc -o ~/.zshrc
```

# Install (Oh-My-Zsh)

First, clone the repository:

```zsh
git clone https://github.com/kalsowerus/kalsowerus.zsh-theme.git ~/.oh-my-zsh/custom/themes/kalsowerus
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

## Installation script

**Warning the following install script will create a new `.zshrc`. Do not execute it if you already modified your `.zshrc`.**

Run the install script, this will create a new `.zshrc` and install a few plugins:

```zsh
~/.oh-my-zsh/custom/themes/kalsowerus/install-omz.sh
```

