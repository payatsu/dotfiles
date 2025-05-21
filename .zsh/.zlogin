. ${HOME}/.profile

[ -f ${ZDOTDIR}/custom/zlogin.local.pre ] && . ${ZDOTDIR}/custom/zlogin.local.pre

[ -f ${ZDOTDIR}/custom/zlogin.local.post ] && . ${ZDOTDIR}/custom/zlogin.local.post || true
