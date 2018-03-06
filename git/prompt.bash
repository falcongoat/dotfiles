source $SCRIPTPATH/lib/colors.bash
source $SCRIPTPATH/lib/prompt.chains.bash

__git_ps1() {
	if [[ -d ./.git ]]; then
		which git > /dev/null
		if [[ $? -eq 0 ]]; then
			__parse_git $1 $2
		fi
	fi

}

__git_last_branch() {
	local value
	local storage="/tmp/.powerline/git_branch.dat"

	if [[ "$1" != "" ]]; then
		echo "$1" > "$storage"
	else
		if [ ! -f "$storage" ]; then
			value=""
		else
		  	value=$(cat "$storage")
		fi
		printf "${value}"
	fi
}

__git_has_remote() {
	local value
	local storage="/tmp/.powerline/git_has_remote.dat"

	if [[ "$1" != "" ]]; then
		echo "$1" > "$storage"
	else
		if [ ! -f "$storage" ]; then
			value=""
		else
	  		value=$(cat "$storage")
	 	fi
		printf "${value}"
	fi
}

__parse_git() {
	local lastbg=${1:-233}
	local exitbg=${2:-237}

	local lastbranch="$(__git_last_branch)"
	local branch="$(git branch 2>&1 | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/g')"

	if [[ "$lastbranch" != "$branch" ]]; then
		__git_last_branch $branch
		git ls-remote --heads 2>&1 | sed -E "s/.*\/(\w+$)/\1/g" | grep $branch > /dev/null
		if [[ $? -eq 0 ]]; then
			__git_has_remote true
			local diffs=($(git rev-list --left-right --count origin/${branch}..${branch} | sed 's/\s+/ /g'))
		else
			__git_has_remote false
		fi
	fi

	local git_sb=$(git status -sb --porcelain=v1 2>&1)
	local modified=$(echo "$git_sb" | grep '^.M' | wc -l)
	local untracked=$(echo "$git_sb" | grep -E '^\?+' | wc -l)

	local bg=22
	_tri_close $lastbg $bg
	_setCol 254
	printf "\uf418\u0020${branch}"

	if [[ ${diffs[0]} -gt 0 || ${diffs[1]} -gt 0 ]]; then
		lastbg=$bg
		bg=28
		_arrow $lastbg $bg
		_setCol 214
		printf "\uf078%d\u0020" "${diffs[0]}"
		_setCol 190
		printf "\uf077%d" "${diffs[1]}"
	fi

	if [[ $modified -gt 0 ]]; then
		lastbg=$bg
		bg=58
		_arrow $lastbg $bg
		_setCol 254
		printf "\uf448%d" "$modified"
	fi

	if [[ $untracked -gt 0 ]]; then
		lastbg=$bg
		bg=130
		_arrow $lastbg $bg
		_setCol 254
		printf "\uf071%d" "$untracked"
	fi

	if [[ $untracked -eq 0 && $modified -eq 0 ]]; then
		lastbg=$bg
		bg=34
		_arrow $lastbg $bg
		_setCol 255
		_pad '\uf00c'
	fi

	lastbg=$bg
	bg=$exitbg
	_arrow $lastbg $bg
}
