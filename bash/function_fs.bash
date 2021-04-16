# vim: fdm=marker ts=2 sts=-1 sw=0 noet

# Fuzzy find file/dir
ff()  { find . -type f -iname "$1";}
fff() { find . -type f -iname "*$1*";}
fd()  { find . -type d -iname "$1";}
fdf() { find . -type d -iname "*$1*";}

fg()  { find . -iname "$1" -exec grep -n "$2" {} +;}
ffg() { find . -type f -iname "$1" -exec grep -n "$2" {} +;}
fdg() { find . -type d -iname "$1" -exec grep -n "$2" {} +;}
