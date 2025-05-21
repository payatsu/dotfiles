#!/bin/bash

BASHDOTDIR=${HOME}/.bash
. ${HOME}/.sh/functions
[ -f ${BASHDOTDIR}/.bashrc.local.pre ] && . ${BASHDOTDIR}/.bashrc.local.pre
. ${BASHDOTDIR}/misc.bash
. ${HOME}/.sh/term.sh
. ${BASHDOTDIR}/prompt.bash
. ${HOME}/.sh/aliases.sh
[ -f ${BASHDOTDIR}/.bashrc.local.post ] && . ${BASHDOTDIR}/.bashrc.local.post || true
