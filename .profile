#!/bin/sh

[ -f ${HOME}/.sh/.profile.local.pre ] && . ${HOME}/.sh/.profile.local.pre

export BASHDOTDIR=${HOME}/.bash
which ${ZSH_VERSION:+-p} vim > /dev/null 2>&1 && export EDITOR=vim || export EDITOR=vi
export PAGER=less
export LESS=MNRSx4
which ${ZSH_VERSION:+-p} lesspipe > /dev/null 2>&1 && eval `lesspipe`

[ -n "${BASH_VERSION}" ] && . ${HOME}/.sh/.functions
export GOPATH=${HOME}/.go
for p in `echo ${GOPATH} | tr : ' '`; do
	append ${p}/bin PATH
done

[ -f ${HOME}/.sh/.profile.local.post ] && . ${HOME}/.sh/.profile.local.post || true
