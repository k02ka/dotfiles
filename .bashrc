# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

if [ -f ~/.git-completion.bash ]; then
    source ~/.git-completion.bash
fi

# User specific aliases and functions
alias grep='grep --color=auto --include=*.html --include=*.php --include=*.inc --include=*.js --include=*.scss --include=*.sh'

# gitのブランチを表示する
function parse_git_branch {
    git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

function proml {
    PS1="[MEGAMI] [\u@$PS_HOSTNAME \w]\[\e[1;31m\]\$(parse_git_branch)\[\e[00m\]\$ "
    #PS1="\h@\u:\W\[\e[1;31m\]\$(parse_git_branch)\[\e[00m\] \$ "
}

proml

