. $SCRIPTPATH/lib/colors.bash

__funkybash() {
	local EXIT_STATUS="$?"      # This has to happen first
	PS1=""
	#PS1+=$(_plTime)
	#PS1+=$(_userHost)
	#PS1+=$(_base)
	#PS1+=$(__git_ps1 233 237)
	#PS1+=$(_tip $EXIT)
	#PS1+=$defaultTermCol
}

