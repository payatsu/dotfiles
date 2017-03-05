#!/bin/zsh

. ${HOME}/.profile

[ -f ${ZDOTDIR}/.zlogin.local.pre ] && . ${ZDOTDIR}/.zlogin.local.pre

[ -f ${ZDOTDIR}/.zlogin.local.post ] && . ${ZDOTDIR}/.zlogin.local.post || true
