#!/bin/zsh

ZDOTDIR=${HOME}/.zsh
if [[ -o rcs ]]; then
    . ${HOME}/.sh/.functions
fi
[ -f ${ZDOTDIR}/.zshenv.local ] && . ${ZDOTDIR}/.zshenv.local || true
