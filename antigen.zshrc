source /usr/share/zsh-antigen/antigen.zsh

antigen use oh-my-zsh

antigen bundle git
antigen bundle fzf
antigen bundle sudo
antigen bundle gradle
antigen bundle extract
antigen bundle npm
antigen bundle nvm
antigen bundle command-not-found
antigen bundle colored-man-pages

antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-history-substring-search
antigen bundle Aloxaf/fzf-tab
antigen bundle unixorn/autoupdate-antigen.zshplugin

antigen bundle kalsowerus/zsh-bitwarden

antigen theme kalsowerus/kalsowerus.zsh-theme

antigen apply

