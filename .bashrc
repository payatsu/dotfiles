BASHDOTDIR=${HOME}/.bash

. ${HOME}/.sh/functions

for f in ${BASHDOTDIR}/*.bash; do
    . ${f}
done
unset f
