#!/bin/sh -e

s=
yes=
while getopts sy arg; do
	case ${arg} in
	s) s=s;;
	y) yes='yes | ';;
	esac
done
shift `expr ${OPTIND} - 1`

dir=`dirname \`readlink -f $0\``
cmd=`basename $0`
LANG=C find ${dir} -mindepth 1 -type d | sed -e "s%^${dir}%${HOME}%" | xargs mkdir -pv
LANG=C find ${dir} -mindepth 1 \( -name ${cmd} -o -name '*.swp' -o -name seq.puml -o -name '*.png' \) -o -empty -prune -o -type f -exec sh -c "${yes}"'cp -i'${s}'uv {} `echo {} | sed -e s%^'${dir}'%${HOME}%`' \;
