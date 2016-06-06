#!/bin/zsh

[ -r ${ZDOTDIR}/.zlogin.local.pre ] && . ${ZDOTDIR}/.zlogin.local.pre || return 0

whence -p vim > /dev/null && export EDITOR=vim || export EDITOR=vi
export PAGER=less

export GOPATH=${HOME}/go
for p in `echo ${GOPATH} | tr : ' '`; do
	append-to ${p}/bin PATH
done

[ -r ${ZDOTDIR}/.zlogin.local.post ] && . ${ZDOTDIR}/.zlogin.local.post || return 0
