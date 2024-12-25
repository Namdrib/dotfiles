# This makes it so the first shell launched in this session will add the keys
# (and optionally prompt for a passphrase), and subsequent ones do not

# Query the idendities currently represented by the agent
# This returns 1 when there are no identities
ssh-add -l > /dev/null

# If there are currently no identities, add them now
if test $status -gt 0
	ssh-add
end
