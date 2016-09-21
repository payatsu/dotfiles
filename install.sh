#!/bin/sh -e

dir=`dirname \`readlink -f $0\``
cmd=`basename $0`
LANG=C find ${dir} -mindepth 1 -maxdepth 1 ! -name ${cmd} ! -name '*.swp' -exec cp -t ${HOME} -iruv {} +
