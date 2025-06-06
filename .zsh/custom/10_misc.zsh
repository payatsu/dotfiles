setopt auto_cd
setopt auto_pushd
setopt chase_dots
setopt chase_links
setopt complete_aliases
setopt no_list_beep
setopt list_packed
setopt extended_history
setopt hist_ignore_dups
setopt hist_ignore_space
setopt hist_save_no_dups
setopt share_history
setopt correct
setopt interactive_comments
setopt no_hup
setopt prompt_subst
setopt function_argzero
setopt sh_word_split
bindkey -e
bindkey "p" history-beginning-search-backward
bindkey "n" history-beginning-search-forward
bindkey '^xe' edit-command-line
zle -N edit-command-line
zle -N insert-last-word smart-insert-last-word
umask 022
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' completer _complete _expand _match _prefix _list _approximate # _history
zstyle ':completion:*:default' menu select=1
zstyle ':completion:*:processes' command "ps -u ${USER} -o pid,stat,%cpu,%mem,cputime,command"
zstyle ':completion:*:*:cdr:*:*' menu selection
LISTMAX=0
HISTFILE=${ZDOTDIR}/.zsh_history
HISTSIZE=100000
SAVEHIST=500000
WORDCHARS=''

zle_highlight=(isearch:underline,bold region:standout,fg=blue special:bold,underline,fg=red suffix:bold paste:bold,fg=green)

[ -r /etc/zsh_command_not_found ] && . /etc/zsh_command_not_found

alias run-help > /dev/null 2>&1 && unalias run-help

add-zsh-hook chpwd chpwd_recent_dirs
