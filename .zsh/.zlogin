#!/bin/zsh

if whence -p vim; then
	export EDITOR=vim
else
	export EDITOR=vi
fi
export PAGER=less

export GOPATH=${HOME}/go
for p in `echo ${GOPATH} | tr : ' '`; do
	append-to ${p}/bin PATH
done

prepend-to /usr/share/man MANPATH
prepend-to /usr/local/share/man MANPATH

[ -f ${ZDOTDIR}/.zlogin.local ] && . ${ZDOTDIR}/.zlogin.local || return 0
