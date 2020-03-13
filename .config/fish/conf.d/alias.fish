alias ".=vdir --color -p --si -A --group-directories-first"
for cmd in build config create down events exec help images \
           kill logs pause port ps pull push restart rm run \
           scale start stop top unpause up version 
  abbr --add ",$cmd" "docker-compose $cmd"
end
abbr --add ,ps 'docker ps --format "{{.Image|printf \"%-35v\"}}{{.Status|printf \"%-15v\"}}{{.Names|printf \"%25v\"}}"'
