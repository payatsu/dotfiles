#!/bin/sh

[ -f ${HOME}/.sh/.profile.local.pre ] && . ${HOME}/.sh/.profile.local.pre

ulimit -c unlimited
which ${ZSH_VERSION:+-p} vim > /dev/null 2>&1 && export EDITOR=vim || export EDITOR=vi
export PAGER=less
export LESS=MRS
which ${ZSH_VERSION:+-p} lesspipe > /dev/null 2>&1 && eval `lesspipe`
export SCREENRC=${HOME}/.screen/screenrc
export screen_so_color=${screen_so_color:-bW}
export screen_caption_color=${screen_caption_color:-bW}
export screen_hardstatus_color=${screen_hardstatus_color:-bw}
export screen_windowlist_color=${screen_windowlist_color:-.B}
export FZF_DEFAULT_OPTS='
--ansi --cycle --multi --reverse --select-1 --exit-0
--color fg:188,bg:233,hl:103,fg+:222,bg+:234,hl+:104
--color info:183,prompt:110,spinner:107,pointer:167,marker:215
'

export GOPATH=${GOPATH:-${HOME}/.go}
for p in `echo ${GOPATH} | tr : ' '`; do
	append ${p}/bin PATH
done

[ -f ${HOME}/.sh/.profile.local.post ] && . ${HOME}/.sh/.profile.local.post || true
