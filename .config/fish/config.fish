alias ".=vdir --color -p --si -A --group-directories-first"
for cmd in build config create down events exec help images \
           kill logs pause port ps pull push restart rm run \
           scale start stop top unpause up version 
  abbr --add ",$cmd" "docker-compose $cmd"
end
function _docker_ps
	docker ps --format "{{.Image|printf \"%-35v\"}}{{.Status|printf \"%-15v\"}}{{.Names|printf \"%25v\"}}"
end
bind \cp "watch -x fish -c _docker_ps; commandline -f repaint"
git config --list | sed -n 's/^alias\.\(.*\)=\(.*\)$/abbr -ag \1 "git \2"/p' | sed -n '/!/!p' | source
