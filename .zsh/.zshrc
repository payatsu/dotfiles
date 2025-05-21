[ -f ${ZDOTDIR}/custom/zshrc.local.pre ] && . ${ZDOTDIR}/custom/zshrc.local.pre

autoload -Uz compinit; compinit
autoload -Uz add-zsh-hook
autoload -Uz edit-command-line
autoload -Uz smart-insert-last-word
autoload -Uz chpwd_recent_dirs cdr
autoload -Uz vcs_info
autoload -Uz run-help run-help-git run-help-p4 run-help-svn run-help-openssl run-help-sudo
# autoload -Uz predict-on; predict-on
# autoload -Uz colors; colors
# autoload -Uz history-search-end

for f in ${ZDOTDIR}/custom/*.zsh; do
    . ${f}
done
unset f

[ -f ${ZDOTDIR}/custom/zshrc.local.post ] && . ${ZDOTDIR}/custom/zshrc.local.post || true
