. $SCRIPTPATH/git/prompt.bash

_plTime() {
	_pill_open 21 0
	_setCol 254 21
	printf "\A"
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

