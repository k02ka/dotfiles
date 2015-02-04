# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific aliases and functions

# gitのブランチを表示する
function parse_git_branch {
	git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

function proml {
	PS1="[MEGAMI] [\u@$PS_HOSTNAME \w]\[\e[1;31m\]\$(parse_git_branch)\[\e[00m\]\$ "
	#PS1="\h@\u:\W\[\e[1;31m\]\$(parse_git_branch)\[\e[00m\] \$ "
}
proml

