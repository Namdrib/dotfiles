# vim: fdm=marker ts=2 sts=-1 sw=0 noet

# Tell grep to highlight matches
if is-supported "grep --color a <<< a"; then
	GREP_OPTIONS+=" --color=auto"
fi

# Avoid VCS folders
if is-supported "echo | grep --exclude-dir=.cvs ''"; then
	for PATTERN in .cvs .git .hg .svn; do
		GREP_OPTIONS+=" --exclude-dir=$PATTERN"
	done
elif is-supported "echo | grep --exclude=.cvs ''"; then
	for PATTERN in .cvs .git .hg .svn; do
		GREP_OPTIONS+=" --exclude=$PATTERN"
	done
fi

unset PATTERN
alias grep='grep $GREP_OPTIONS'
export GREP_COLORS='mt=1;32'
