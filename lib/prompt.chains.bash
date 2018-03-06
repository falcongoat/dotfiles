source $SCRIPTPATH/themes/default.bash

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
	_pad(){
		printf "\u0020${1}\u0020"
	}


#	Glyphs
#	..........................................................................
	_arrowR='\uE0B0'
	_arrowL='\uE0B2'
	_arrow2R='\uE0D4'
	_pillL='\uE0B6'
	_pillR="\uE0B4"

