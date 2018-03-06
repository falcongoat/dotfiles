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

#	Create variable storage if not present & clear it
STORAGE="/tmp/.powerline"
[ ! -d "$STORAGE" ] && mkdir "$STORAGE" > /dev/null
echo rm -rf "${STORAGE}/*"

