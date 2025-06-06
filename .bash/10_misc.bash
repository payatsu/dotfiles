HISTCONTROL=ignoredups
HISTFILE=${BASHDOTDIR}/.bash_history
HISTFILESIZE=500000
HISTSIZE=10000
[ -f /usr/share/bash-completion/bash_completion ] && . /usr/share/bash-completion/bash_completion
if [ "`uname -s`" != Darwin ]; then
    shopt -s autocd
    shopt -s checkjobs
    shopt -s dirspell
    shopt -s globstar
fi
shopt -s cdspell
shopt -s checkhash
shopt -s checkwinsize
shopt -s cmdhist
shopt -s extglob
shopt -s histreedit
shopt -s hostcomplete
