# General
alias clear='clear -x'
alias vimx='vim'
alias ll='ls -latrh'
alias szrc='source $HOME/.zshrc'
alias zshrc='vim ~/.zshrc && szrc'
alias ealias='vim ~/.oh-my-zsh/custom/general-aliases.zsh && szrc'
alias brewfile='vim ~/.Brewfile && bbic'
alias activate='. venv/bin/activate'
alias build_devc='docker buildx build . --platform linux/amd64 -t docker.repo.local.sfdc.net/docker-dev-local-1/mrnair/dev-container:latest'
alias push_devc='docker push docker.repo.local.sfdc.net/docker-dev-local-1/mrnair/dev-container:latest'

# Brew
alias bbic="brew update &&\
    brew bundle install --cleanup --file=~/.Brewfile --no-lock &&\
    brew upgrade"
# Tmux
alias t='tmux'
alias tn='tmux new -s'
alias ta='tmux a -t'
alias tls='tmux ls'
alias tk='tmux kill-session -t'
alias tr='tmux source-file ~/.tmux.conf'

# Kubernetes
alias kgp="kubectl get pods "
alias k="kubectl "
alias kga="kubectl get all "
alias kc="kubectx "
alias kn="kubens"
alias kd="kubectl describe "
alias ke="kubectl edit "
alias kaf="kubectl apply -f "
alias kg="kubectl get "
alias kgs="kubectl get services "
alias kl="kubectl logs "
alias kpf="kubectl port-forward "
alias kdp="kubectl describe pod "
alias kexec="kubectl exec -it "
alias kdf="kubectl delete -f "

# Git
alias gis="git status"
