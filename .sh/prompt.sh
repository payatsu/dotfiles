#!/bin/sh

prompt_symbol()
{
    [ "${1}" = emoji ] && {
        ambiguous_padding=' '
        ok=$'\U1F197'${ambiguous_padding}
        ng=$'\U1F196'${ambiguous_padding}
        idle=$'\U1F4A4'${ambiguous_padding}
        his=$'\U1F4DD'${ambiguous_padding}
        job=$'\U1F3C3'${ambiguous_padding}
        lvl=$'\U1F41A'${ambiguous_padding}
        cal=$'\U1F4C6'${ambiguous_padding}
        tim=$'\U231A'${ambiguous_padding}
        mps=$'\U2199'${ambiguous_padding}
        ps=$'\U1F449'${ambiguous_padding}
        rps=$'\U1F4CA'${ambiguous_padding}
    } || {
        ambiguous_padding=
        [ "${1}" = aa ] && {
            ok="(*^-'${ZSH_VERSION:+%})b"
            ng="(#\`_'${ZSH_VERSION:+%})p"
            idle="( =_=${ZSH_VERSION:+%}).ozZ"
        } || {
            ok=OK
            ng=NG
            idle=zZ
        }
        his=h
        job=j
        lvl=l
        cal=
        tim=' '
        mps=
        ps='$'
        rps=?
    }
    bell=$'\a'
}

prompt_idle()
{
    ok=${idle}
    ng=${idle}
    bell=
}
prompt()
{
    [ "${1}" = prev ] && set "${prev_prompt}" || prev_prompt=${1}
    case "${1}" in
    simple) PS1=${simple_prompt};;
    simplest)PS1='$ ';;
    *) prompt_symbol ${1}; PS1=${custom_prompt};;
    esac
}

prompt_symbol
