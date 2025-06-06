#!/bin/sh

[ "${TERM}" = dumb ] && color= || color=' --color=auto'
alias ag='ag --nogroup'
alias df='df -h'
alias diff="diff${color}"
alias du='du -h'
alias gcov='gcov -bdflmr'
alias grep="grep`echo | command grep -e '' --exclude-dir='*.svn' > /dev/null 2>&1 && echo ' '--exclude-dir="'*.svn'"`${color}"
alias g='grep'
alias gtags='gtags -c'
alias h='history'
alias hw='hw --no-group'
alias indent='indent -bad -bap -bbb -bbo -bc -br -brs -cdb -cdw -ce -hnl -i4 -l80 -lp -ncs -nfc1 -npcs -nprs -npsl -nsaf -nsai -nsaw -nss -sc -ts4'

for opt in -X --time-style=long-iso --group-directories-first; do
    command ls ${opt} /dev/null > /dev/null 2>&1 && ls_opt="${ls_opt} ${opt}"
done
alias l="ls -Flhp${ls_opt}${color}"
unset opt ls_opt

alias lv='lv -c'

if [ "`uname -s`" = Darwin ]; then
    alias p='ps xwwU${USER} -ouser,pid,ppid,pcpu,pmem,vsz,rss,pri,ni,tty,stat,start,time,command'
else
    alias p='ps xwwU${USER} ouser,pid,ppid,pcpu,pmem,vsz:7,rss:6,pri,ni,tname:5,stat,bsdstart,bsdtime,command'
fi

alias pstree='pstree -Aahnp'
alias pt='pt --nogroup'
alias rg='rg --no-heading'
alias v='vim'
alias vimdiff="vimdiff -c 'windo %foldopen!'"
alias vmstat='vmstat -SM'
alias xxd='xxd -g 1'
for gcc in `find \`echo ${PATH} | tr : ' '\` -maxdepth 1 ! -type d -executable -regextype posix-basic -regex '^/.\+/\([^-]\+-[^-]\+-\([^-]\+-\([^-]\+-\)\?\)\?\)\?gcc' -exec basename \{\} \; 2> /dev/null | sort | uniq`; do
    triplet=`echo ${gcc} | sed -e 's/gcc$//'`
    alias ${triplet}addr2line="${triplet:-\${eu_\}}addr2line -Cf"
    alias ${triplet}gcc="${triplet}gcc -std=c17`[ -z ${triplet} ] && echo ' -march=native'` `LANG=C command ${triplet}gcc -fsyntax-only -Q --help=warnings,^joined,^separate,common --help=warnings,^joined,^separate,c | grep -v '\[enabled\]\|-Wabi\|-Waggregate-return\|-Wchkp\|-Wc90-c99-compat\|-Wpadded\|-Wsystem-headers\|-Wtraditional[^-]' | grep -oe '-W[[:graph:]]\+' | sed -e 's/<[0-9,]\{1,\}>//' | xargs echo`"
    which ${ZSH_VERSION:+-p} ${triplet}g++ > /dev/null 2>&1 && alias ${triplet}g++="${triplet}g++ -std=c++17`[ -z ${triplet} ] && echo ' -march=native'` `LANG=C command ${triplet}g++ -fsyntax-only -Q --help=warnings,^joined,^separate,common --help=warnings,^joined,^separate,c++ | grep -v '\[enabled\]\|-Wabi\|-Waggregate-return\|-Wchkp\|-Wc90-c99-compat\|-Wpadded\|-Wsystem-headers\|-Wtraditional[^-]\|-Wnamespaces\|-Wtemplates' | grep -oe '-W[[:graph:]]\+' | sed -e 's/<[0-9,]\{1,\}>//' | xargs echo`"
    which ${ZSH_VERSION:+-p} ${triplet}gdb > /dev/null 2>&1 && alias ${triplet}gdb="${triplet}gdb -q"
    alias ${triplet}nm="${triplet:-\${eu_\}}nm -C"
    alias ${triplet}objdump="${triplet:-\${eu_\}}objdump\`eval [ -z \"\${eu_}\" ] && echo ' -Cw'\`"
    alias ${triplet}readelf="${triplet:-\${eu_\}}readelf -W"
    [ -n "${triplet}" ] && unset triplet && continue
    for u in ar ranlib size strings strip; do
        alias ${u}=\${eu_}${u}
    done
done
alias clang='clang -std=c17 -Wpedantic -Weverything'
alias clang++='clang++ -std=c++17 -Wpedantic -Weverything'
alias rust-gdb='rust-gdb -q'
eu()
{
    case ${1} in
    enable|activate)    eu_=eu-;;
    disable|deactivate) eu_=;;
    --help) [ -n "${BASH_VERSION}" ] && type ${FUNCNAME[0]} || which ${0};;
    *) echo error: unknown option: \'${1}\'. try \'--help\'.>&2; return 1;;
    esac
}

if which ${ZSH_VERSION:+-p} git > /dev/null && ! git config --global core.pager > /dev/null; then
    git config --global core.pager ''
    git config --global log.date iso-local
    git config --global format.pretty 'tformat:%C(auto,yellow)%>|(13)%h%Creset %C(auto,blue)%ad%Creset [%C(auto,green)%<(8,trunc)%an%Creset] %C(auto)%s%Creset%C(auto)%d%Creset'
fi

[ `uname -s` = Darwin ] || od()
{
    local width=16
    while getopts :w: arg; do
        case ${arg} in
        w) echo ${OPTARG} | grep -qe '^[[:digit:]]\+$' && width=${OPTARG} || width=32;;
        esac
    done
    local max_digit=`printf '%x' \`expr ${width} - 1\` | wc -c`
    local padding=$((4 * 2 - ${max_digit} + 1))
    echo -n '       '
    seq 0 4 `expr ${width} - 1` | xargs printf '%0'${max_digit}'x ' | sed -e "s/ /`printf '%*s' ${padding}`/g;s/ \\+\$//"
    echo
    echo -n '       '
    printf '%*s\n' $((${width} * 2 + ${width} / 4 - 1)) | sed -e 's/ /-/g'
    command od -Ax -tx4z -v --endian=big "$@" | sed -e '$d'
}
