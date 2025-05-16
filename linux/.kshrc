[[ $- != *i* ]] && return

set -o vi

alias vi='nvim' \
    bc='bc -q' \
    vim='nvim' \
    t='terraform' \
    g='git' \
    a='aws' \
    ns='doas nvim' \
    ql='qlist' \
    kb='minikube' \
    ap='ansible-playbook' \
    e='doas emerge' \
    k='minikube kubectl --' \
    es='doas eselect' \
    qo='qlop' \
    eq='equery' \
    eb='doas ebuild' \
    h='date "+%a %b %d %r %G"'
