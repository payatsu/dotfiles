#!/bin/sh

echo ${TERM} | grep -qe '^xterm'  && export TERM=xterm-256color
echo ${TERM} | grep -qe '^screen' && export TERM=screen-256color
[ "${TERM}" = screen-256color ] && [ -n "${TERMCAP}" ] && export TERMCAP="`echo ${TERMCAP} | sed -e 's/Co#8/Co#256/g'`"
