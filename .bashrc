#!/bin/bash

. ${HOME}/.sh/.functions
[ -f ${BASHDOTDIR}/.bashrc.local.pre ] && . ${BASHDOTDIR}/.bashrc.local.pre
. ${BASHDOTDIR}/.misc
. ${HOME}/.sh/.term
. ${BASHDOTDIR}/.prompt
. ${HOME}/.sh/.aliases
[ -f ${BASHDOTDIR}/.bashrc.local.post ] && . ${BASHDOTDIR}/.bashrc.local.post || true
