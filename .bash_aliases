# shellcheck disable=SC2139

alias dir='\ls -s --si --color --sort=size --group-directories-first'
alias less='\less -rS'
alias y='\yadm'
alias compose='\docker-compose'

for what in build config down logs pull push run up
do
	alias $what="docker-compose $what"
	complete -F _docker_compose_${what} ${what}
done
