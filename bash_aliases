# ==============================================================================
# quedayone ~/.bash_aliases file.
# Version 1.2
# February 14, 2015 - added aliases from .bashrc
# May 19, 2015 quedayone version eh!
# Will Pierce 
# some taken from 
# https://gist.github.com/natelandau/10654137
# ==============================================================================
# Finder / Terminal / alias
# ==============================================================================
alias appleUpdates='softwareupdate -l'
alias ls='ls -GFh'
alias ll='ls -lahG'
alias myip="ifconfig | sed -En 's/127.0.0.1//;s/.*inet (addr:)?(([0-9]*\.){3}[0-9]*).*/\2/p'"
# can also redefine a command to add options
alias mv='mv -i'
alias cp='cp -i'
alias rm='rm -i'
alias df='df -h'
alias du='du -h'
alias mkdir='mkdir -p'
# can be used to fix common typos you make
alias pdw='pwd'
# ==============================================================================
## Show hidden files
# ==============================================================================
alias showFiles='defaults write com.apple.finder AppleShowAllFiles YES; killall Finder /System/Library/CoreServices/Finder.app'
alias hideFiles='defaults write com.apple.finder AppleShowAllFiles NO; killall Finder /System/Library/CoreServices/Finder.app'
# ==============================================================================
alias home='cd ~'
alias up='cd ..'
alias h='history'
alias f='open -a Finder ./' # f: Opens current directory in MacOS Finder
# ==============================================================================
# memHogsTop, memHogsPs:  Find memory hogs
# ==============================================================================
alias memHogsTop='top -l 1 -o rsize | head -20'
alias memHogsPs='ps wwaxm -o pid,stat,vsize,rss,time,command | head -10'
# ==============================================================================
# cpuHogs:  Find CPU hogs
# ==============================================================================
alias cpu_hogs='ps wwaxr -o pid,stat,%cpu,time,command | head -10'
# ==============================================================================
# topForever:  Continual 'top' listing (every 10 seconds)
# ==============================================================================
alias topForever='top -l 9999999 -s 10 -o cpu'
# ==============================================================================
# ttop:  Recommended 'top' invocation to minimize resources
# ==============================================================================
# Taken from this macosxhints article
# http://www.macosxhints.com/article.php?story=20060816123853639
# ==============================================================================
alias ttop="top -R -F -s 10 -o rsize"
# ==============================================================================
# my_ps: List processes owned by my user:
# ==============================================================================
my_ps() { ps $@ -u $USER -o pid,%cpu,%mem,start,time,bsdtime,command ; }
# ==============================================================================
# NETWORKING
# ==============================================================================
# myip: Public facing IP Address
alias publicIp='curl ip.appspot.com'

# Internal IP
alias myip="ifconfig | sed -En 's/127.0.0.1//;s/.*inet (addr:)?(([0-9]*\.){3}[0-9]*).*/\2/p'" 

# netCons: Show all open TCP/IP sockets
alias netCons='lsof -i'

# flushDNS: Flush out the DNS Cache
alias flushDNS='dscacheutil -flushcache'

# lsock: Display open sockets
alias lsock='sudo /usr/sbin/lsof -i -P'

# lsockU: Display only open UDP sockets
alias lsockU='sudo /usr/sbin/lsof -nP | grep UDP'

# lsockT: Display only open TCP sockets
alias lsockT='sudo /usr/sbin/lsof -nP | grep TCP'

# ipInfo0: Get info on connections for en0
alias ipInfo0='ipconfig getpacket en0'

# ipInfo1: Get info on connections for en1
alias ipInfo1='ipconfig getpacket en1'

# openPorts: All listening connections
alias openPorts='sudo lsof -i | grep LISTEN' 

# showBlocked:  All ipfw rules inc/ blocked IPs
alias showBlocked='sudo ipfw list'

#   ii:  display useful host related informaton
# ==============================================================================
    ii() {
        echo -e "\nYou are logged on ${RED}$HOST"
        echo -e "\nAdditionnal information:$NC " ; uname -a
        echo -e "\n${RED}Users logged on:$NC " ; w -h
        echo -e "\n${RED}Current date :$NC " ; date
        echo -e "\n${RED}Machine stats :$NC " ; uptime
        echo -e "\n${RED}Current network location :$NC " ; scselect
        echo -e "\n${RED}Public facing IP Address :$NC " ;myip
        #echo -e "\n${RED}DNS Configuration:$NC " ; scutil --dns
        echo
    }

# ==============================================================================
# WEB DEVELOPMENT
# ==============================================================================
# apacheEdit: Edit httpd.conf
alias apacheEdit='sudo edit /etc/httpd/httpd.conf'

# apacheRestart: Restart Apache
alias apacheRestart='sudo apachectl graceful'

# editHosts: Edit /etc/hosts file
alias editHosts='sudo edit /etc/hosts'

# herr: Tails HTTP error logs
alias herr='tail /var/log/httpd/error_log'

# Apachelogs: Shows apache error logs
alias apacheLogs="less +F /var/log/apache2/error_log"

# httpHeaders: Grabs headers from web page
httpHeaders () { /usr/bin/curl -I -L $@ ; } 

# httpDebug: Download a web page and show info on what took time
# ==============================================================================
httpDebug () { /usr/bin/curl $@ -o /dev/null -w "dns: %{time_namelookup} connect: %{time_connect} pretransfer: %{time_pretransfer} starttransfer: %{time_starttransfer} total: %{time_total}\n" ; }
  