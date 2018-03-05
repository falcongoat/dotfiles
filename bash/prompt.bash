. $SCRIPTPATH/bash/colors.bash
. $SCRIPTPATH/git/prompt.bash

powerline() {
	local EXIT="$?"
	PS1=""
	PS1+=$(_plTime) 
	PS1+=$(_userHost)
	PS1+=$(_base) 
	PS1+=$(__git_ps1 233 237)
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
	#_pill_open 233 236
	_tri_open 233 236
	_setCol 244 233

	local path_dirs
	OIFS=$IFS
	IFS='/'
	read -ra path_dirs <<< $(pwd)
	IFS=$OIFS

	printf "\uE0BD${path_dirs[1]}\uE0BD..."
	printf "\uE0BD${path_dirs[-1]}\uE0BD"
}

_tip() {
	local bg=237
	[[ $1 -gt 0 ]] && bg=88
	#_arrow 28 $bg
	_setCol 250 $bg 
	_pad "$"
	_arrow $bg 0
}

_pad(){
	printf "\u0020${1}\u0020" 
}
_arrow() {
	printf "%b\uE0B0" "$(_setCol $1 $2)"
}
_pill_open() {
	printf "%b\uE0B6" "$(_setCol $1 $2)"
}
_tri_open() {
	printf "%b\uE0BA" "$(_setCol $1 $2)"
}
_tri_close() {
	printf "%b\uE0BC" "$(_setCol $1 $2)"
}

