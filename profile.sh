
#	-----------------------------
#	01. ENVIRONMENT CONFIGURATION
#	-----------------------------

#   Add color to terminal
#   (this is all commented out as I use Mac Terminal Profiles)
#   from http://osxdaily.com/2012/02/21/add-color-to-the-terminal-in-mac-os-x/
#	..........................................................................
	export TERM=xterm-256color
	export CLICOLOR=$TERM

	export LS_OPTIONS='--color'
#	export LS_COLORS=ExFxBxDxCxegedabagacad
#	export LS_COLORS=gxfxbEaEBxxEhEhBaDaCaD
#	export LS_COLORS='di=52:ln=35:so=32:pi=33:ex=31:bd=34;46:cd=34;43:su=30;41:sg=30;46:tw=30;42:ow=30;43'
	export LS_COLORS="rs=0:di=01;34:ln=01;36:mh=00:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:mi=00:su=37;41:sg=30;43:ca=30;41:tw=30;42:ow=34;42:st=37;44:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arc=01;31:*.arj=01;31:*.taz=01;31:*.lha=01;31:*.lz4=01;31:*.lzh=01;31:*.lzma=01;31:*.tlz=01;31:*.txz=01;31:*.tzo=01;31:*.t7z=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.dz=01;31:*.gz=01;31:*.lrz=01;31:*.lz=01;31:*.lzo=01;31:*.xz=01;31:*.zst=01;31:*.tzst=01;31:*.bz2=01;31:*.bz=01;31:*.tbz=01;31:*.tbz2=01;31:*.tz=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.war=01;31:*.ear=01;31:*.sar=01;31:*.rar=01;31:*.alz=01;31:*.ace=01;31:*.zoo=01;31:*.cpio=01;31:*.7z=01;31:*.rz=01;31:*.cab=01;31:*.jpg=01;35:*.jpeg=01;35:*.mjpg=01;35:*.mjpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.svg=01;35:*.svgz=01;35:*.mng=01;35:*.pcx=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.m2v=01;35:*.mkv=01;35:*.webm=01;35:*.ogm=01;35:*.mp4=01;35:*.m4v=01;35:*.mp4v=01;35:*.vob=01;35:*.qt=01;35:*.nuv=01;35:*.wmv=01;35:*.asf=01;35:*.rm=01;35:*.rmvb=01;35:*.flc=01;35:*.avi=01;35:*.fli=01;35:*.flv=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.yuv=01;35:*.cgm=01;35:*.emf=01;35:*.ogv=01;35:*.ogx=01;35:*.aac=00;36:*.au=00;36:*.flac=00;36:*.m4a=00;36:*.mid=00;36:*.midi=00;36:*.mka=00;36:*.mp3=00;36:*.mpc=00;36:*.ogg=00;36:*.ra=00;36:*.wav=00;36:*.oga=00;36:*.opus=00;36:*.spx=00;36:*.xspf=00;36:"

	. bash/colors.bash


#	Change Prompt
#	..........................................................................
	. bash/prompt.bash

    #export PS1='\A | \u@\h:\w $ '
    #export PS1="\A \[\033[0;97m\]\u\[\033[0;38m\]@${yellowOnBlue1}\h: \[\033[1;33m\]\W\[\033[0;96m\]\$(parse_git_branch)\[\033[00m\] $  "
    #export PS1="\A \u@\h: \W $(parse_git_branch) $  "
    export PS1="$(powerline)"

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