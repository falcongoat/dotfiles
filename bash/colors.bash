export bold="\[\e[1m\]"
export bold_off="\[\e[21m\]"

export black="\[\e[38;5;16m\]"
export black_bg="\[\e[48;5;16m\]"
export gray_light="\[\e[38;5;253m\]"
export gray_medium="\[\e[38;5;247m\]"
export gray_dark="\[\e[38;5;240m\]"
export gray_somber="\[\e[38;5;233m\]"
export red_dark="\[\e[38;5;52m\]"

export defaultTermFG="${gray_light}"
export defaultTermCol="\[\e[m${defaultTermFG}"

export white="\[\e[1;37m\]"
export nocolor="\[\e[0m\]"

export blue="\[\e[0;34m\]"
export light_blue="\[\e[1;34m\]"
export green="\[\e[0;32m\]"
export light_green="\[\e[1;32m\]"
export cyan="\[\e[0;36m\]"
export light_cyan="\[\e[1;36m\]"
export red="\[\e[0;31m\]"
export red_old="\[\e[0;31m\]"
export light_red="\[\e[1;31m\]"

export magenta="\[\e[0;35m\]"
export yellow="\[\e[0;33m\]"

export yelOnBlu1="\\[\e[38;5;11;48;5;21m\]"

colors256() {
	local c i j

	printf "Colors 0 to 15 for the standard 16 colors\n"
	for c in {0..15}; do
		_colorRows $c 8 7
	done
	printf "\n"

	printf "Colors 16 to 231 for 256 colors\n"
	for c in {16..231}; do
		_colorRows $c 36 15
	done	
	printf "\n"

	printf "Greyscale 232 to 255 for 256 colors\n"
	for c in {232..255}; do
		_colorRows $c 32
	done
	printf "\n"
}

_colorRows() {
	local color=$1
	local width=$2
	local offset=${3:-0}

	_echoPill $color
	[[ $(( ($color - $width - $offset) % $width )) -eq 0 ]] && printf "%s\n" "$(tput sgr0)"
}

_echoPill(){
		color=$1
		eSeq1="\e[38;5;${color};48;5;0m"
		eSeq2="\e[38;5;0;48;5;${color}m\e[21m"
		printf '%b\uE0B6%b%3q%b\uE0B4' $eSeq1 $eSeq2 $color $eSeq1;
}

_echoSquare(){
		color=$1
		eSeq1="\[\e[48;5;${color};38;5;0m"
		printf '%b%3q' $eSeq1 $color;
}
