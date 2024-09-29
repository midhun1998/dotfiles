# General
alias vimx='vim'
alias ll='ls -latr'
alias sz='source $HOME/.zshrc'

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
