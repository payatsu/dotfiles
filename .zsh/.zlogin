#!/bin/zsh

export EDITOR=vi
export PAGER=less

echo ${MANPATH} | grep -q /usr/local/share/man || export MANPATH=/usr/local/share/man:${MANPATH}
[ -f ${ZDOTDIR}/.zlogin.local ] && . ${ZDOTDIR}/.zlogin.local
