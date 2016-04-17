#!/bin/zsh

export EDITOR=vi
export PAGER=less

export GOPATH=${HOME}/go
prepend-to /usr/local/share/man MANPATH

[ -f ${ZDOTDIR}/.zlogin.local ] && . ${ZDOTDIR}/.zlogin.local
