BASHDOTDIR=${HOME}/.bash

. ${HOME}/.sh/functions.sh

for f in ${BASHDOTDIR}/*.bash; do
    . ${f}
done
unset f
