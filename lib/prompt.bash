. $SCRIPTPATH/lib/colors.bash

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

#	Functions
#	..........................................................................
	_chain() {
		local glyph="$1"
		local element="$2"
		local bg_old="$3"
		local fg_new="$4"
		local bg_new="$5"
		printf "%s%b%s%b" "$(_setCol $bg_old $bg_new)" "$glyph" "$(_setCol $fg_new $bg_new)" "$element"
	}
	_chain_inv() {
		local glyph="$1"
		local element="$2"
		local bg_old="$3"
		local fg_new="$4"
		local bg_new="$5"
		printf "%s%b%s%b" "$(_setCol $bg_new $bg_old)" "$glyph" "$(_setCol $fg_new $bg_new)" "$element"
	}
	_setCol() {
		local fg="$(__fg $1 1)"
		local bg="$(__bg $2 1)"
		printf "%b" "$fg$bg"
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

		if [[ $(( ${#pathdirs[@]} -1 )) -gt 2 ]]; then
			path="${pathdirs[0]}/${pathdirs[1]}/.../${pathdirs[-1]}"
			[[ ${pathdirs[0]} != ~* ]] && path="/$path"
		fi

		printf "$path"
	}


#	Icons
#	..........................................................................
	_arrowR='\uE0B0'
	_arrowL='\uE0B2'
	_arrow2R='\uE0D4'
	_pillL='\uE0B6'
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
	_pathBg=236
	_pathFg=246
