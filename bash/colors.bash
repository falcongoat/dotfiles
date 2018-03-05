	export bold="\033[1m"
	export bold_off="\033[21m"

	export black="\033[38;5;16m"
	export black_bg="\033[48;5;16m"
	export light_gray="\033[38;5;7m"

	export defaultTermCol="\033[m${light_gray}"

	export dark_gray="\033[1;30m"
	export white="\033[1;37m"
	export nocolor="\033[0m"

	export blue="\033[0;34m"
	export light_blue="\033[1;34m"
	export green="\033[0;32m"
	export light_green="\033[1;32m"
	export cyan="\033[0;36m"
	export light_cyan="\033[1;36m"
	export red="\033[0;31m"
	export red_old="\[\033[0;31m\]"
	export light_red="\033[1;31m"

	export magenta="\033[0;35m"
	export yellow="\033[0;33m"

	export yelOnBlu1="\\033[38;5;11;48;5;21m"

	_256colors(){
		echo "System colors:"
		for color in {0..15}; do
			_colorRows $color 8
		done
		echo -e $defaultTermCol

		echo "Color cube, 6x6x6:"
		x=6; y=6; sides=6
		page=x*y
		offset=16
		for (( yi = 0; yi < y; yi++ )); do
			for (( si = 0; si < sides; si++ )); do
				start=si*page+yi*x+offset
				end=start+x
				for (( xi = start; xi < end; xi++ )); do
					color=$xi
					_echoPill $color
				done
				echo -e -n $defaultTermCol
			done
			echo
		done
		echo

		echo "Grayscale"
		for gray in {232..255}; do
			_colorRows $gray 32
		done

		echo -e $defaultTermCol
	}

	_colorRows() {
		color=$1
		width=$2
		_echoPill $color
		[[ $(( ($color - $width + 1) % $width )) -eq 0 ]] && echo -e $defaultTermCol
	}

	_echoPill(){
			color=$1
			eSeq1="\033[38;5;${color};48;5;0m"
			eSeq2="${bold}\033[38;5;0;48;5;${color}m\033[21m"
			printf '%b\uE0B6%b%3q%b\uE0B4' $eSeq1 $eSeq2 $color $eSeq1;
	}

	_echoSquare(){
			color=$1
			eSeq1="\033[48;5;${color};38;5;0m"
			printf '%b%3q' $eSeq1 $color;
	}

	_color_matrix() {
		color_start=30;
		color=$color_start;
		for style in 0 1 4 5 7; do
			while [ $color -lt 48 ]; do
				colString="$style;$color"
				echo -n -e "\\033[${colString}m $colString"
				((color++))
			done
			echo -e "$light_gray";		
			color=$color_start;	
		done
		echo -e "$light_gray";		
		return


		while [ $color -lt 245 ]; do
		    echo -e "$color: \\033[38;5;${color}mhello\\033[48;5;$(($color-16))mworld\\033[0m"
		    ((color++));
		done 
	}

