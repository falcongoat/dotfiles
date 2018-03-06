. $SCRIPTPATH/lib/colors.bash

__funkybash() {
	local EXIT_STATUS="$?"      # This has to happen first
	PS1=""
	PS1+="$(__user)"
	PS1+="$(_arrowR $UserFG2 $AtBG)"
	PS1+="$(__at)"
	PS1+="$(_arrowR $AtFG2 $HostBG)"
	PS1+="$(__host)"
	#PS1+=$(_plTime)
	#PS1+=$(_userHost)
	#PS1+=$(_base)
	#PS1+=$(__git_ps1 233 237)
	#PS1+=$(_tip $EXIT)
	PS1+=$DEFAULT
}

#	Functions
#	..........................................................................


#	Elements
#	..........................................................................
	__user() {
		printf "%s%b%s" "$UserPre" '\\u' "$UserPost"
	}
	__at() {
		printf "%s@%s" "$AtPre" "$AtPost"
	}
	__host() {
		printf "%s%b%s" "$HostPre" '\h' "$HostPost"
	}

#	Icons
#	..........................................................................
	_arrowR() {
		printf "%s%s\uE0B0" "$1" "$2"
	}
	_arrow2R() {
		printf "%s%s\uE0D4" "$1" "$2"
	}
	_arrowL() {
		printf "%b\uE0B2" "$(_setCol $1 $2)"
	}
	_pill_open() {
		printf "%b\uE0B6" "$(_setCol $1 $2)"
	}
	_pill_close() {
		printf "%b\uE0B4" "$(_setCol $1 $2)"
	}

#	Colorscheme
#	..........................................................................
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
