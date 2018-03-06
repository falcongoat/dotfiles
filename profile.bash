#!/bin/bash

#	-------------------
#	01. INITIALIZATION
#	-------------------

#	Check, if the script was sourced or called directly
#	Set $SCRIPTPATH accordingly to reflect PWD
if [[ $_ != $0 ]]; then
	SCRIPTPATH="$(dirname $BASH_SOURCE)"    # sourced
else
	SCRIPTPATH="$(dirname $0)"              # called directly
fi 

#	Create variable storage if not present
[ ! -d "/tmp/.powerline" ] && mkdir /tmp/.powerline > /dev/null

