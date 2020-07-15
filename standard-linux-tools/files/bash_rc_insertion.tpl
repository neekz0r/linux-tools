export GIT_PROMPT_ONLY_IN_REPO=1
source ~/.git_bash_prompt/current/gitprompt.sh

function nonzero_return() {
	RETVAL=$?
	[ $RETVAL -ne 0 ] && echo -e "\033[31m✘-${RETVAL}\033[39m" || echo -e "\033[32m✔\033[39m"
}

PS1="\`nonzero_return\` \[\e[33m\]\w\[\e[m\] [\[\e[35m\]\u\[\e[m\]\[\e[32m\]@\[\e[m\]\[\e[35m\]\h\[\e[m\]]\\n\A \\$ "

if command -v code &> /dev/null
then
  export VISUAL=code
else
  export VISUAL=vi
fi
export EDITOR="$VISUAL"
