. $SCRIPTPATH/bash/colors.bash

__git_ps1() {
	if [[ -d ./.git ]]; then
		which git > /dev/null
		if [[ $? -eq 0 ]]; then
			__parse_git
		fi
	fi
}

__parse_git() {
	local lastbg=${1:-233}
	local exitbg=${2:-237}

	local git_sb=$(git status -sb --porcelain=v1 2>&1)
	local branch=$(git branch 2>&1 | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/')
	local modified=$(echo "$git_sb" | grep '^.M' | wc -l)
	local untracked=$(echo "$git_sb" | grep -E '^\?+' | wc -l)
	local diffs=($(git rev-list --left-right --count origin/${branch}..${branch}|sed 's/\s+/ /g'))

	local bg=22
	_arrow $lastbg $bg
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
