#!/bin/bash
# configure-apache2-userdir.sh
# THIS SCRIPT MAY BE HARMFUL FOR YOU!
# USE IT ON YOUR OWN RISK!!!

F=/etc/apache2/mods-available/userdir.conf
O="Options"
E="ExecCGI"
A='AddHandler cgi-script .cgi'

# if no ExecCGI in Options list, add it
if [[ ! $(cat $F | grep $O | grep $E) ]]; then
  sed -e "s|\($O.*\)$|\1 $E|;" -i $F
fi

# if no 'AddHandler' for CGI in file, add it
if [[ ! $(cat $F | grep "$A") ]]; then
  sed -e "s|\(\s*\)\($O.*\)$|\1\2\n\1$A|;" -i $F
fi

# enable userdir module
/usr/sbin/a2enmod userdir

# restart apache
/usr/sbin/apache2ctl restart
