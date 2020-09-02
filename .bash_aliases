alias doc='docker'
alias dcomp='docker-compose'
alias docip='docker inspect -f "{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}"'
docker_shell() {
	docker exec -it "$1" /bin/bash
}
alias docsh=docker_shell
alias cdproj='cd /home/mike/dev/jdd/webdata/components/com_jdd'
alias ..='cd ..'
alias ...='cd ../../'
alias ....='cd ../../../'
alias .....='cd ../../../../'
alias monserver="ssh monserver -t tmux a"
alias admin='cd ~/dev/jdd/webdata/administrator/components/com_jdd'
alias comp='cd ~/dev/jdd/webdata/components/com_jdd'
alias build='cd ~/dev/jdd/build'
alias media='cd ~/dev/jdd/webdata/media/com_jdd'
alias gitplog='git log --graph --color --pretty=format:"%x1b[31m%h%x09%x1b[32m%d%x1b[0m%x20%s"'
alias gitlog='git log --oneline --decorate --graph'
alias fd=fdfind
alias lzd='~/go/bin/lazydocker'
alias vi='nvim'
