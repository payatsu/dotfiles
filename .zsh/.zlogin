#!/bin/zsh

[ -r ${ZDOTDIR}/.zlogin.local.pre ] && . ${ZDOTDIR}/.zlogin.local.pre

whence -p vim > /dev/null 2>&1 && export EDITOR=vim || export EDITOR=vi
export PAGER=less

export GOPATH=${HOME}/go
for p in `echo ${GOPATH} | tr : ' '`; do
	append-to ${p}/bin PATH
done

[ -r ${ZDOTDIR}/.zlogin.local.post ] && . ${ZDOTDIR}/.zlogin.local.post || return 0
