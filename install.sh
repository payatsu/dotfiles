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
LANG=C find ${dir} -mindepth 1 \( -name .git -o -name .github \) -prune -o -type d -print | sed -e "s%^${dir}%${HOME}%" | xargs mkdir -pv
LANG=C find ${dir} -mindepth 1 \( \
	-name ${cmd} -o \
	-name .git -o \
	-name .github -o \
	-name seq.puml -o \
	-name '*.swp' -o \
	-name '*.png' -o \
	-name LICENSE -o \
	-name README.md \) -prune -o -empty -prune -o -type f -exec sh -c "${yes}"'cp -i'${s}'v {} `echo {} | sed -e s%^'${dir}'%${HOME}%`' \;
