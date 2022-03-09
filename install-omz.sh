#!/bin/sh

symlink="$ZSH/custom/themes/kalsowerus.zsh-theme"
if [ ! -L "$symlink" ] && [ ! -e "$symlink" ]; then
	ln -s $ZSH/custom/themes/kalsowerus/kalsowerus.zsh-theme $symlink
fi

fzf_tab="$ZSH/custom/plugins/fzf-tab"
if [ ! -d "$fzf_tab" ]; then
	git clone https://github.com/Aloxaf/fzf-tab.git $fzf_tab
fi

zsh_autosuggestions="$ZSH/custom/plugins/zsh-autosuggestions"
if [ ! -d "$zsh_autosuggestions" ]; then
	git clone https://github.com/zsh-users/zsh-autosuggestions.git $zsh_autosuggestions
fi

zsh_syntax_highlighting="$ZSH/custom/plugins/zsh-syntax-highlighting"
if [ ! -d "$zsh_syntax_highlighting" ]; then
	git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $zsh_syntax_highlighting
fi

if [ -e ~/.zshrc ]; then
	mv ~/.zshrc ~/.zshrc.old
fi
cp $ZSH/custom/themes/kalsowerus/.zshrc ~/.zshrc
sed -i "1iexport ZSH=\"$HOME/.oh-my-zsh\"" ~/.zshrc

