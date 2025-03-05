# Helper functions to run fzf for useful tasks

function fzf-cd -d "cd to the directory containing a fuzzily-matched file. It’s like ctrl-t, but you end up where the file is, rather than having the file name inserted into the prompt"
	set file (fzf +m -q "$1") && set dir (dirname "$file") && cd "$dir"
	return
end

function fzf-grep -d "Recursively grep through files. Ignores .git directory"
	grep "" –exclude-dir=.git -r | fzf -m | awk '{ print $1; }' | cut -d: -f1
end

function fzf-gitbranch -d "Select a git branch"
	git branch –all | grep -v HEAD | string trim | fzf | read -l result; and echo "$result"
end

function fzf-gitstatus -d "Select files based on git status"
	git status -s | fzf -m | awk '{ print $2 }'
end
