parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

powerline() {
    powerline="$(_plDate) $(_userHost)$(_basedir) $(parse_git_branch) $  "
    echo "$powerline"
}

_plDate() {
	echo "\A"
}

_userHost() {
	echo "\u@\h:"
}

_basedir() {
	echo "\W"
}