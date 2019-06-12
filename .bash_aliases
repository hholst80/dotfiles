# shellcheck disable=SC2139

alias less='less -S'
alias y='yadm'

for what in build config down logs pull push up
do
	alias $what="docker-compose $what"
	complete -F _docker_compose_${what} ${what}
done

alias tug='./tugboat'
