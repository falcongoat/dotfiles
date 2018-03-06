. $SCRIPTPATH/lib/colors.bash

__funkybash() {
	local EXIT_STATUS="$?"      # This has to happen first
	PS1=""
	PS1+="$(__user)"
	#PS1+=$(_plTime)
	#PS1+=$(_userHost)
	#PS1+=$(_base)
	#PS1+=$(__git_ps1 233 237)
	#PS1+=$(_tip $EXIT)
	PS1+=$DEFAULT
}

__user() {
	printf "%s%b" "$UserC" '\\u'
}

#	COLORSCHEME
	UserFG="$(__fg 16 1)"
	UserBG="$(__bg 250 1)"
	UserC="$UserFG$UserBG"
