
# ==============================================================================
# bash_profile file version 1.2
# for macroot or as basis for other users
# ==============================================================================

# ==============================================================================
# Welcome message
# Generate your own welcome message at 
# http://patorjk.com/software/taag/#p=display&f=Graffiti&t=Type%20Something%20
# ==============================================================================
echo "Welcome to Unix
#              .___                .__                               
#  _____     __| _/ _____  ______  |__|  ____ _______   ____   ____  
#  \__  \   / __ | /     \ \____ \ |  |_/ __ \\_  __ \_/ ___\_/ __ \ 
#   / __ \_/ /_/ ||  Y Y  \|  |_> >|  |\  ___/ |  | \/\  \___\  ___/ 
#  (____  /\____ ||__|_|  /|   __/ |__| \___  >|__|    \___  >\___  >
#       \/      \/      \/ |__|             \/             \/     \/ "
echo ""
echo "You are logged in as:"
echo -n "-------------------> "; whoami
echo "On Computer:"
echo -n "-------------------> "; scutil --get ComputerName
echo ""
echo -n "Today is "; date +"%A, %B %d, %Y. %r"
echo ""
echo "You are rocken the IP address:"; ifconfig | sed -En 's/127.0.0.1//;s/.*inet (addr:)?(([0-9]*\.){3}[0-9]*).*/\2/p'
echo ""
#
# ==============================================================================
# Get computer uptime in days 
# ==============================================================================
echo -n "Your uptime is: " 
declare -x awk="/usr/bin/awk"
declare -x sysctl="/usr/sbin/sysctl"
declare -x perl="/usr/bin/perl"
declare -xi DAY=86400
declare -xi EPOCH="$($perl -e "print time")"
declare -xi UPTIME="$($sysctl kern.boottime |
$awk -F'[= ,]' '/sec/{print $6;exit}')"
#
declare -xi DIFF="$(($EPOCH - $UPTIME))"
#
if [ $DIFF -le $DAY ] ; then
	echo "1 day"
else
	echo "$(($DIFF / $DAY)) days"
fi
#
# ==============================================================================
# Set the prompt
# ==============================================================================
export PS1="\[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h:\[\033[33;1m\]\w\[\033[m\]\$ "
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad
# ==============================================================================
# Load in the configuration file .bashrc
# ==============================================================================
if [ -f ~/.bashrc ]; then
	source ~/.bashrc
	echo "User .bashrc file found and loaded"
else  
	echo "User .bashrc file NOT found"
fi
#
# ==============================================================================
# Load in the aliases file comment out if you no want
# ==============================================================================
if [ -f ~/.bash_aliases ]; then
	. ~/.bash_aliases
	echo ".bash_aliases loaded. To list aliases enter alias"
else
	echo ".bash_aliases NOT loaded"
fi
#
# ==============================================================================  
# http://osxdaily.com/2011/10/03/add-a-separator-time-stamp-between-terminal-commands-to-increase-readability/
#
# Modified from emilis bash prompt script
# from https://github.com/emilis/emilis-config/blob/master/.bash_ps1
# Modified for Mac OS X by
# @corndogcomputer
#
# Fill with minuses
#
# (this is recalculated every time the prompt is shown in function prompt_command):
#
fill="--- "
#
reset_style='\[\033[00m\]'
#
status_style=$reset_style'\[\033[0;90m\]' # gray color; use 0;37m for lighter color
#
prompt_style=$reset_style
#
command_style=$reset_style'\[\033[1;29m\]' # bold black
#
# Prompt variable:
#
PS1="$status_style"'$fill \t\n'"$prompt_style"'${debian_chroot:+($debian_chroot)}\u@\h:\w\$'"$command_style "
#
# Reset color for command output
#
# (this one is invoked every time before a command is executed):
trap 'echo -ne "\033[00m"' DEBUG
#
function prompt_command {
#
# create a $fill of all screen width minus the time string and a space:
let fillsize=${COLUMNS}-9
fill=""
while [ "$fillsize" -gt "0" ]
do
fill="-${fill}" # fill with underscores to work on
let fillsize=${fillsize}-1
done
# If this is an xterm set the title to user@host:dir

case "$TERM" in

xterm*|rxvt*)

bname=`basename "${PWD/$HOME/~}"`

echo -ne "\033]0;${bname}: ${USER}@${HOSTNAME}: ${PWD/$HOME/~}\007"

;;

*)

;;

esac


}

PROMPT_COMMAND=prompt_command