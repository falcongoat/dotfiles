#	-----------------------------
#	01. ENVIRONMENT CONFIGURATION
#	-----------------------------

#   Add color to terminal
#   (this is all commented out as I use Mac Terminal Profiles)
#   from http://osxdaily.com/2012/02/21/add-color-to-the-terminal-in-mac-os-x/
#	..........................................................................



#	Change Prompt
#	..........................................................................

	. $SCRIPTPATH/bash/prompt.bash

    PROMPT_COMMAND=powerline


#	Set paths
#	..........................................................................
#	export PATH="$PATH:/usr/local/bin"
#	export PATH="/usr/local/git/bin:/sw/bin/:/usr/local/bin:/usr/local/:/usr/local/sbin:/usr/local/mysql/bin:$PATH"
	export PATH=/usr/local/sbin:/usr/local/bin:/opt/local/bin:/opt/local/sbin:$PATH


#	Set default editor
#	..........................................................................
	export EDITOR=/usr/bin/vim
	#[[ ! -h /usr/local/bin/subl ]] && ln -s /Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl /usr/local/bin/.

#	Set default blocksize for ls, df, du
#	from this: http://hints.macworld.com/comment.php?mode=view&cid=24491
#	..........................................................................
	export BLOCKSIZE=1k


#	------------------------
#	02. MAKE TERMINAL BETTER
#	------------------------

#	Aliases
#	..........................................................................
	
	. $SCRIPTPATH/bash/aliases.bash

#	GIT
#	..........................................................................

	. $SCRIPTPATH/git/prompt.bash

<<EOF
	if [ -f ~/.git-completion.bash ]; then
	  . ~/.git-completion.bash
	fi

#	------------
#	xx. PERLBREW
#	------------
	source ~/perl5/perlbrew/etc/bashrc
	perlbrew use perl-5.18.1
EOF