. $SCRIPTPATH/git/prompt.bash

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

_base() {
	#_pill_open 233 236
	_tri_open 233 236
	_setCol 244 233

	local path_dirs
	OIFS=$IFS
	IFS='/'
	read -ra path_dirs <<< $(pwd)
	IFS=$OIFS

	if [[ $(( ${#path_dirs} - 1)) -gt 2 ]]; then
		printf "\uE0BD${path_dirs[1]}\uE0BD..."
		printf "\uE0BD${path_dirs[-1]}\uE0BD"
	else
		printf "$(pwd)"
	fi
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

