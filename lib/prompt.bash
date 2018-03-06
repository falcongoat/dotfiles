source $SCRIPTPATH/lib/colors.bash
source $SCRIPTPATH/lib/prompt.chains.bash
source $SCRIPTPATH/git/prompt.bash

__funkybash() {
	local EXIT_STATUS="$?"      # This has to happen first
	PS1="$(_chain_inv $_pillL   $(__user) $_termBg $_userFg $_userBg)"
	#PS1+=""
	PS1+="$(_chain     $_arrowR $(__at)   $_userBg $_atFg   $_atBg)"
	PS1+="$(_chain     $_arrowR $(__host) $_atBg   $_hostFg $_hostBg)"
	PS1+="$(_chain_inv $_pillL  $(__base) $_hostBg $_pathFg $_pathBg)"
	#PS1+=$(_base)
	#PS1+=$(__git_ps1 233 237)
	#PS1+=$(_tip $EXIT)
	PS1+="\[\e$DEFAULT\]"
}

#	Elements
#	..........................................................................
	__user() {
		printf "%s" '\\u'
	}
	__at() {
		printf "@"
	}
	__host() {
		printf "%b" '\h'
	}
	__base() {
		local path="$(pwd)"
		path=${path/$HOME/"~"}
		local pathdirs=(${path//\// })
		local pathlength=$(( ${#pathdirs[@]} -1 ))
		local pathdiff=$(( $pathlength-2 ))

		if [[  $pathlength -gt 2 ]]; then
			path="${pathdirs[0]}/${pathdirs[1]}/..${pathdiff}../${pathdirs[-1]}"
			[[ ${pathdirs[0]} != ~* ]] && path="/$path"
		fi

		printf "$path"
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
	_pathBg=236
	_pathFg=246
