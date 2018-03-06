. $SCRIPTPATH/lib/colors.bash

__funkybash() {
	local EXIT_STATUS="$?"      # This has to happen first
	PS1="$(_pill_open $(__user) $_termBg $_userFg $_userBg)"
	PS1+=""
	PS1+="$(_chain_arrowR $(__a) $_userBg $_atFg $_atBg)"
	PS1+="$(_chain_arrowR $(__host) $_atBg $_hostFg $_hostBg)"
	#PS1+="$(__user)"
	#PS1+="$(_arrowR $UserFG2 $AtBG)"
	#PS1+="$(__at)"
	#PS1+="$(_arrowR $AtFG2 $HostBG)"
	#PS1+="$(__host)"
	#PS1+="$(_arrowR $HostFG2 $BLACKB)"
	#PS1+=$(_base)
	#PS1+=$(__git_ps1 233 237)
	#PS1+=$(_tip $EXIT)
	PS1+="\[\e$DEFAULT\]"
}

#	Functions
#	..........................................................................
	_chain_arrowR() {
		local element="$1"
		local bg_old="$2"
		local fg_new="$3"
		local bg_new="$4"
		printf "%b\uE0B0%b%s" "$(_setCol $bg_old $bg_new)" "$(_setCol $fg_new $bg_new)" "$element"
	}

	_pill_open() {
		local element="$1"
		local bg_old="$2"
		local fg_new="$3"
		local bg_new="$4"
		printf "%b\uE0B6%b%s" "$(_setCol $bg_new $bg_old)" "$(_setCol $fg_new $bg_new)" "$element"
	}

	_setCol() {
		local fg="$(__fg $1 1)"
		local bg="$(__bg $2 1)"
		printf "%b" "$fg$bg"
	}

#	Elements
#	..........................................................................
	__user() {
		printf "%b" '\\u'
	}
	__at() {
		printf "@"
	}
	__host() {
		printf "%s%b%s" "$HostPre" '\h' "$HostPost"
	}

#	Icons
#	..........................................................................
	_arrow2R() {
		printf "%s%s\uE0D4" "$1" "$2"
	}
	_arrowL() {
		printf "%b\uE0B2" "$(_setCol $1 $2)"
	}
	_pill_close() {
		printf "%b\uE0B4" "$(_setCol $1 $2)"
	}

#	Colorscheme
#	..........................................................................
	_termBg=16

	_userFg=236
	_userBg=250
	_atFg=234
	_atBg=248
	_hostFg=232
	_hostBg=246

	UserFG1="$(__fg 236 1)"
	UserFG2="$(__fg 250 1)"
	UserBG="$(__bg 250 1)"
	UserPre="$UserFG1$UserBG"

	AtFG1="$(__fg 234 1)"
	AtFG2="$(__fg 248 1)"
	AtBG="$(__bg 248 1)"
	AtPre="$AtFG1$AtBG"
	AtPost="$AtFG1$AtBG"

	HostFG1="$(__fg 232 1)"
	HostFG2="$(__fg 246 1)"
	HostBG="$(__bg 246 1)"
	HostPre="$HostFG1$HostBG"
	HostPost="$HostFG1$HostBG"
