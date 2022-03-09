# theme
background() {
	echo "%{$bg[$1]%}$2%{$reset_color%}"
}

last_background() {
	echo "%(?:%{$bg[$1]%}:%{$bg[red]%})$2%{$reset_color%}"
}

foreground() {
	echo "%{$fg[$1]%}$2%{$reset_color%}"
}

arrow() {
	echo $(background $1 $(foreground $2 " $4 "))$(background $3 $(foreground $1 ''))
}

last_arrow() {
	echo $(background $1 $(foreground $2 " $4 "))$(last_background $3 $(foreground $1 ''))
}

BLACK='black'
WHITE='white'
NONE='none'

COLOR_NAME='blue'
COLOR_DIRECTORY='magenta'
COLOR_GIT='cyan'
COLOR_NVM='green'
COLOR_ERROR='red'

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
	echo -n "$LINE1_PREFIX"

	declare -a arrows
	arrows[1]=($COLOR_NAME '%n@%m')
	arrows[3]=($COLOR_DIRECTORY '%~')
	local index=5
	
	if __git_prompt_git rev-parse --get-dir &> /dev/null; then
		arrows[$index]=($COLOR_GIT "$(git_prompt_info)")
		((index+=2))
	fi

	local nvm_prompt=$(nvm_prompt_info)
	if [ ! -z $nvm_prompt ]; then
		arrows[$index]=($COLOR_NVM $nvm_prompt)
	fi

	for i in {1..${#arrows}..2}; do
		if [ $i -lt $((${#arrows} - 2)) ]; then
			echo -n "$(arrow $arrows[$i] $BLACK $arrows[(($i + 2))] $arrows[(($i + 1))])"
		else
			echo -n "$(last_arrow $arrows[$i] $BLACK $NONE $arrows[(($i + 1))])"
		fi
	done

	echo -n "$ERROR_ARROW\n$LINE2_PREFIX "
}

PROMPT='$(prompt)'

# useful WSL2 stuff
export HOST=$(awk '/nameserver / {print $2; exit}' /etc/resolv.conf 2>/dev/null)
export LIBGL_ALWAYS_INDIRECT=1
export DISPLAY=${HOST}:0

# other stuff
alias ls='ls --group-directories-first --color=auto -h'

if [ -z "${JAVA_HOME}" ]; then
	export JAVA_HOME=/opt/jdk
fi
export PATH=$PATH:$JAVA_HOME/bin

