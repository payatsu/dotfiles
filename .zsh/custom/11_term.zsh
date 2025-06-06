. ${HOME}/.sh/term.sh

[ "${EMACS}" = t ] && unsetopt zle

set_window_title()
{
    [ "${set_window_title}" = deactivated ] && return
    commandline=`echo ${2:-zsh} | sed -E -e 's/[[:alnum:]]+=('\''[^'\'']*'\''|"[^"]*"|[[:graph:]])+//;s/^ +//'`
    command=`echo "${commandline}" | cut -d ' ' -f 1 | head -n 1`
    [ "${command}" != fg ] && type -- ${command} | grep -Fqe "${command} is a shell builtin" && return
    commandline=`echo "${commandline}" | sed -e 's/^fg$/& %%/'`
    [ "${command}" = fg ] && command=`jobs -l \`echo "${commandline}" | sed -e 's/^fg \{1,\}//'\` | sed -e 's/^\(\[[[:digit:]]\{1,\}\] \{1,\}\)[-+]/\1 /;s/(tty output)//' | awk '{print $4}'`
    case ${TERM} in
    screen*) echo -n '\ek'`basename -- "${command}"`'\e\\';;
    esac
}
add-zsh-hook preexec set_window_title
add-zsh-hook precmd set_window_title

title()
{
    case ${1} in
    enable|activate)
        set_window_title=activated;;
    disable|deactivate)
        set_window_title=deactivated
        case ${TERM} in
        screen*) echo -n '\ek'`basename ${SHELL}`'\e\\';;
        esac;;
    --help) which ${0};;
    *) echo error: unknown option: \'${1}\'. try \'--help\'.>&2; return 1;;
    esac
}
