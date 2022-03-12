![preview](theme.png)

Requires a Powerline-compatible font.

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

This assumes Antigen is installed under `/usr/share/zsh-antigen/antigen.zsh`. You can install it like this

```zsh
sudo mkdir -p /usr/share/zsh-antigen
sudo curl -L git.io/antigen -o /usr/share/zsh-antigen/antigen.zsh
```

