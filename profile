
#	-----------------------------
#	01. ENVIRONMENT CONFIGURATION
#	-----------------------------

#   Add color to terminal
#   (this is all commented out as I use Mac Terminal Profiles)
#   from http://osxdaily.com/2012/02/21/add-color-to-the-terminal-in-mac-os-x/
#	..........................................................................
#	export CLICOLOR=1
#	export LSCOLORS=ExFxBxDxCxegedabagacad
	export TERM=xterm-256color
	export CLICOLOR=$TERM

	export black="\033[0;30m"
	export black_bg=
	export light_gray="\\033[0;37m"
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
		color=0;
		colWidth=${1:-12}
		offset=${2:-0}

		# 1st row
		for color in {0..15}; do
			_echoPill $color
		done
		echo

		for color in {16..255}; do
			_echoPill $color
			[[ $(( ($color - 15) % $colWidth )) -eq 0 ]] && echo
		done
		echo -e "$light_gray";
	}

	_echoPill(){
			color=$1
			eSeq1="\\033[38;5;${color};48;5;0m"
			eSeq2="\\033[38;5;0;48;5;${color}m"
			printf '%b\uE0B6%b%3q%b\uE0B4' $eSeq1 $eSeq2 $color $eSeq1;
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

	export LS_OPTIONS='--color'
	export LS_COLORS="di=52"
	#export LS_COLORS=gxfxbEaEBxxEhEhBaDaCaD
	#export LS_COLORS='di=52:ln=35:so=32:pi=33:ex=31:bd=34;46:cd=34;43:su=30;41:sg=30;46:tw=30;42:ow=30;43'
	#export LS_COLORS

#	Change Prompt
#	..........................................................................
    parse_git_branch() {
        git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
    }

    #export PS1='\A | \u@\h:\w $ '
    #export PS1="\A \[\033[0;97m\]\u\[\033[0;38m\]@${yellowOnBlue1}\h: \[\033[1;33m\]\W\[\033[0;96m\]\$(parse_git_branch)\[\033[00m\] $  "
    export PS1="\A \u@\h: \W $(parse_git_branch) $  "

return

#	Set paths
#	..........................................................................
#	export PATH="$PATH:/usr/local/bin"
#	export PATH="/usr/local/git/bin:/sw/bin/:/usr/local/bin:/usr/local/:/usr/local/sbin:/usr/local/mysql/bin:$PATH"
	export PATH=/usr/local/sbin:/usr/local/bin:/opt/local/bin:/opt/local/sbin:$PATH

#	Set default editor
#	..........................................................................
	export EDITOR=/usr/bin/vim
	[[ ! -h /usr/local/bin/subl ]] && ln -s /Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl /usr/local/bin/.

#	Set default blocksize for ls, df, du
#	from this: http://hints.macworld.com/comment.php?mode=view&cid=24491
#	..........................................................................
	export BLOCKSIZE=1k

#	------------------------
#	02. MAKE TERMINAL BETTER
#	------------------------

#	Aliases
#	..........................................................................
	alias cp='cp -iv'                           # Preferred 'cp' implementation
	alias mv='mv -iv'                           # Preferred 'mv' implementation
	alias mkdir='mkdir -pv'                     # Preferred 'mkdir' implementation
	alias ll='ls -FGlAhp'                       # Preferred 'ls' implementation
	alias less='less -FSRXc'                    # Preferred 'less' implementation
	alias cd..='cd ../'                         # Go back 1 directory level (for fast typers)
	alias ..='cd ../'                           # Go back 1 directory level
	alias ...='cd ../../'                       # Go back 2 directory levels
	alias .3='cd ../../../'                     # Go back 3 directory levels
	alias .4='cd ../../../../'                  # Go back 4 directory levels
	alias .5='cd ../../../../../'               # Go back 5 directory levels
	alias .6='cd ../../../../../../'            # Go back 6 directory levels
	alias edit='subl'                           # edit:         Opens any file in sublime editor
	alias f='open -a Finder ./'                 # f:            Opens current directory in MacOS Finder
	alias ~="cd ~"                              # ~:            Go Home
	alias c='clear'                             # c:            Clear terminal display
#	alias which='type -all'                     # which:        Find executables
	alias path='echo -e ${PATH//:/\\n}'         # path:         Echo all executable Paths
	alias show_options='shopt'                  # Show_options: display bash options settings
	alias fix_stty='stty sane'                  # fix_stty:     Restore terminal settings when screwed up
	alias cic='set completion-ignore-case On'   # cic:          Make tab-completion case-insensitive
	mcd () { mkdir -p "$1" && cd "$1"; }        # mcd:          Makes new Dir and jumps inside
	trash () { command mv "$@" ~/.Trash ; }     # trash:        Moves a file to the MacOS trash
	ql () { qlmanage -p "$*" >& /dev/null; }    # ql:           Opens any file in MacOS Quicklook Preview
	cd() { builtin cd "$@"; ll; }               # Always list directory contents upon 'cd'
#	alias DT='tee ~/Desktop/terminalOut.txt'    # DT:           Pipe content to file on MacOS Desktop

	# SSH
	alias insa4sim0='ssh -p 1022 root@insa4.dyndns.org -i ~/.ssh/id_rsa_kdev'

	# rsyncing
	alias doc_sync='rsync -av --exclude=pagefile.sys /Volumes/Dokumente/ /Volumes/Bkp10-tempr/Backups/2015-03\ Synced\ Dokumente\ Partition/'
	alias doc_restore='rsync -av --exclude=pagefile.sys /Volumes/Bkp10-tempr/Backups/2015-03\ Synced\ Dokumente\ Partition/ /Volumes/Dokumente/'

	# GIT
	if [ -f ~/.git-completion.bash ]; then
	  . ~/.git-completion.bash
	fi

#	------------
#	xx. PERLBREW
#	------------
	source ~/perl5/perlbrew/etc/bashrc
	perlbrew use perl-5.18.1
