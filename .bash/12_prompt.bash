. ${HOME}/.sh/prompt.sh

bold=`tput bold`
reset=`tput sgr0`
red=`tput setaf 1`
green=`tput setaf 2`
blue=`tput setaf 4`
cyan=`tput setaf 6`
magenta=`tput setaf 5`
yellow=`tput setaf 3`

colors=(red green blue cyan magenta yellow)
hostname_color=${colors[((0x`hostname | sha256sum - | grep -oe '[[:xdigit:]] '` % ${#colors[@]}))]}

abbrev_host=`echo ${HOSTNAME} | sed -e 's/\(^.\{6\}\)...\{1,\}/\1../'`
PROMPT_DIRTRIM=4

prompt_command(){ [ $? = 0 ] && last_status=${green}${ok}${reset} || last_status=${red}${ng}${reset}$'\a';}
PROMPT_COMMAND=prompt_command

custom_prompt='\[${bold}\]\u\[${reset}\]@\[${bold}\]\[`eval echo \\\$${hostname_color}`\]${abbrev_host}\[${reset}\][\[${bold}\]${last_status}\[${reset}\]](\[${bold}\]\[${magenta}\]${his}\[${reset}\]:\[${bold}\]\!\[${reset}\]/\[${bold}\]\[${cyan}\]${job}\[${reset}\]:\[${bold}\]\j\[${reset}\]/\[${bold}\]\[${yellow}\]${lvl}\[${reset}\]:\[${bold}\]${SHLVL}\[${reset}\]):\[${bold}\]\w\[${reset}\]
\[${bold}\]${cal}\D{%m:%d}\[${reset}\]\[${bold}\]${tim}\t\[${reset}\]\[${bold}\]\$\[${reset}\] '
simple_prompt='\[${bold}\]\u\[${reset}\]@\[${bold}\]\[`eval echo \\\$${hostname_color}`\]\h\[${reset}\]:\[${bold}${magenta}\]\w\[${reset}\]\$ '
PS1=${custom_prompt}
