# theme
background() {
	echo "%{$bg[$1]%}$2%{$reset_color%}"
}

foreground() {
	echo "%{$fg[$1]%}$2%{$reset_color%}"
}

arrow() {
	echo $(background $1 $(foreground $2 " $4 "))$(background $3 $(foreground $1 ''))
}

BLACK='black'
WHITE='white'
NONE='none'

COLOR_NAME='green'
COLOR_DIRECTORY='blue'
COLOR_GIT='magenta'
COLOR_ERROR='red'

NAME_ARROW=$(arrow $COLOR_NAME $BLACK $COLOR_DIRECTORY '%n@%m')
DIRECTORY=$(arrow $COLOR_DIRECTORY $BLACK $NONE '%~')
DIRECTORY_GIT=$(arrow $COLOR_DIRECTORY $BLACK $COLOR_GIT '%~')
DIRECTORY_ERROR=$(arrow $COLOR_DIRECTORY $BLACK $COLOR_ERROR '%~' )
DIRECTORY_ARROW="%(?:$DIRECTORY:$DIRECTORY_ERROR)"
ERROR=$(arrow $COLOR_ERROR $BLACK $NONE '%?')
ERROR_ARROW="%(?::$ERROR)"
LINE1_PREFIX=$(foreground $COLOR_NAME '┌')
LINE2_PREFIX=$(foreground $COLOR_NAME '└─')$(foreground $WHITE '$')

ZSH_THEME_GIT_PROMPT_PREFIX=' '
ZSH_THEME_GIT_PROMPT_SUFFIX=''

git_arrow() {
	echo "%(?:$(arrow $COLOR_GIT $BLACK $NONE $1):$(arrow $COLOR_GIT $BLACK $COLOR_ERROR $1))"
}

prompt() {
	if ! __git_prompt_git rev-parse --git-dir &> /dev/null; then
		echo "$LINE1_PREFIX$NAME_ARROW$DIRECTORY_ARROW$ERROR_ARROW
$LINE2_PREFIX "
	else
		echo "$LINE1_PREFIX$NAME_ARROW$DIRECTORY_GIT$(git_arrow $(git_prompt_info))$ERROR_ARROW
$LINE2_PREFIX "
	fi
}

PROMPT='$(prompt)'

# useful WSL2 stuff
export HOST=$(awk '/nameserver / {print $2; exit}' /etc/resolv.conf 2>/dev/null)
export LIBGL_ALWAYS_INDIRECT=1
export DISPLAY=${HOST}:0

# other stuff
export FZF_CTRL_T_COMMAND=${FZF_DEFAULT_COMMAND}

if typeset -f fzf-cd-widget > /dev/null; then
	bindkey '^E' fzf-cd-widget
fi

alias ls='ls --group-directories-first --color=auto -h'

if [ -z "${JAVA_HOME}" ]; then
	export JAVA_HOME=/test
fi
export PATH=$PATH:$JAVA_HOME/bin

