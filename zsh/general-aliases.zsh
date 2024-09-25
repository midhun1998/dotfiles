# General
alias vimx='vim'

# Tmux
alias t='tmux'
alias tn='tmux new -s'
alias ta='tmux a -t'
alias tls='tmux ls'
alias tk='tmux kill-session -t'
alias tr='tmux source-file ~/.tmux.conf'

# Others
alias opc='rlogin -l opcbuild swe-vm-kcr-proteus0$(($RANDOM % 7 + 1))'
alias uxp='rlogin -l svc-uxmgr swe-vm-kcr-uxp0$(($RANDOM % 2 + 1))'
alias scemgr='ssh -l svc-scemgr'
alias scerun='ssh -l svc-sce-runner'
alias sshme='ssh -l midhunn'
alias python='/depot/Python-3.6.2/bin/python'

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
