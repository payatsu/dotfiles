#!/bin/sh -e

yes=
while getopts y arg; do
	case ${arg} in
	y) yes='yes | ';;
	esac
done
shift `expr ${OPTIND} - 1`

dir=`dirname \`readlink -f $0\``
cmd=`basename $0`
LANG=C find ${dir} -mindepth 1 -type d | sed -e "s%^${dir}%${HOME}%" | xargs mkdir -pv
LANG=C find ${dir} -mindepth 1 \( -name ${cmd} -o -name '*.swp' \) -o -empty -prune -o -type f -exec sh -c "${yes}"'cp -iuv {} `echo {} | sed -e s%^'${dir}'%${HOME}%`' \;
