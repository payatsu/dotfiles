#!/bin/sh -e

dir=`dirname \`readlink -f $0\``
cmd=`basename $0`
find ${dir} -mindepth 1 -maxdepth 1 ! -name ${cmd} -exec cp -t ${HOME} -rf {} +
