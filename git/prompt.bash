source $SCRIPTPATH/lib/colors.bash
source $SCRIPTPATH/lib/prompt.chains.bash

__git_ps1() {
	if [[ -d ./.git ]]; then
		which git > /dev/null
		if [[ $? -eq 0 ]]; then
			__parse_git $1 $2
		else
			printf "NO git"
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

	_chain $_arrowR "\uf418 $branch" $_pathBg $_git_branchFg $_git_branchBg
	lastbg="$_git_branchBg"

	if [[ ${diffs[0]} -gt 0 || ${diffs[1]} -gt 0 ]]; then
		_chain $_arrowR "\uf448${diffs[0]}" $lastbg $_git_originFg $_git_originBg
		printf "\uf077%d" "${diffs[1]}"


		#lastbg=$bg
		#bg=28
		#_arrow $lastbg $bg
		#_setCol 214
		#printf "\uf078%d\u0020" "${diffs[0]}"
		#_setCol 190
		#printf "\uf077%d" "${diffs[1]}"
	fi

	if [[ $modified -gt 0 ]]; then
		_chain $_arrowR "\uf448$modified" $lastbg $_git_modifiedFg $_git_modifiedBg
		lastbg=$_git_modifiedBg
	fi

	if [[ $untracked -gt 0 ]]; then
		_chain $_arrowR "\uf071$untracked" $lastbg $_git_untrackedFg $_git_untrackedBg
		lastbg=$_git_untrackedBg
	fi

	if [[ $untracked -eq 0 && $modified -eq 0 ]]; then
		_chain $_arrowR "\uf00c" $lastbg $_git_br_cleanFg $_git_br_cleanBg
		lastbg=$_git_br_cleanBg
	fi
: <<'COM3'
	lastbg=$bg
	bg=$exitbg
	_arrow $lastbg $bg
COM3
}
