#!/bin/sh -e

dir=`dirname \`readlink -f $0\``
cmd=`basename $0`
LANG=C find ${dir} -mindepth 1 -type d | sed -e "s%^${dir}%${HOME}%" | xargs mkdir -p
LANG=C find ${dir} -mindepth 1 \( -name ${cmd} -o -name '*.swp' \) -prune -o -type f -print | sed -e "s%^${dir}\([[:graph:]]\+\)\$%cp -iuv & ${HOME}\1%" | sh
