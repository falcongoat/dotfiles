. bash/colors.bash

powerline() {
	local EXIT="$?"
	PS1=""
	PS1+=$(_plTime) 
	PS1+=$(_userHost)
	PS1+=$(_base) 
	PS1+=$(parse_git_branch)
	PS1+=$(_tip $EXIT) 
	PS1+=$defaultTermCol
}

_setCol() {
	local col="\[\e[$(tput setaf $1)"
	[[ $2 ]] && col+="${col}$(tput setab $2)"
	col+="\]"
	printf "%s" $col
}

_plTime() {
	_pill_open 21 0
	_setCol 254 21
	printf "\A"
}

_userHost() {
	_pill_open 236 21
	_setCol 252 236 
	printf "%s" '\u'
	_setCol 250 
	printf '@'
	_setCol 248
	printf '\h'
}

_base() {
	_pill_open 233 237
	_setCol 244 233
	printf "\W/"
}

parse_git_branch() {
	branch=$(git branch 2>&1 | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/')
	diffs=($(git rev-list --left-right --count origin/${branch}..${branch}|sed 's/\s+/ /g'))
  _arrow 233 22
  _setCol 255
	printf '\uf418' 
	if [[ ${diffs[0]} -gt 0 && ${diffs[1]} -gt 0 ]]; then
		_setCol 208
		printf "\uf078%d" "${diffs[0]}" 
		_setCol 148 
		printf "\uf077%d" "${diffs[1]}"
	fi
  _arrow 22 28
  _setCol 255 28 
	printf "$branch"
}


_tip() {
	local bg=237
	[[ $1 -gt 0 ]] && bg=88
	_arrow 28 $bg
	_setCol 250 
	_pad "$"
	_arrow $bg 0
}

_pad(){
	printf "\u0020%s\u0020" "${1}" 
}
_arrow() {
	printf "%b\uE0B0" "$(_setCol $1 $2)"
}
_pill_open() {
	printf "%b\uE0B6" "$(_setCol $1 $2)"
}

