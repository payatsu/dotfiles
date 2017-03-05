#!/bin/bash

. ${HOME}/.profile

[ -r ${BASHDOTDIR}/.bash_profile.local.pre ] && . ${BASHDOTDIR}/.bash_profile.local.pre

[ -r ${BASHDOTDIR}/.bash_profile.local.post ] && . ${BASHDOTDIR}/.bash_profile.local.post || true
