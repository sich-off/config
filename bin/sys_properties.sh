#!/bin/bash

OLD_IFS=$IFS
IFS=$'\n'
PATH="/usr/bin:/usr/sbin:/bin:/sbin"

MB_VENDOR=$(dmidecode -s baseboard-manufacturer 2>/dev/null);
MB_VERSION=$(dmidecode -s baseboard-product-name 2>/dev/null);
BIOS_VENDOR=$(dmidecode -s bios-vendor 2>/dev/null);
CPU=$(cat /proc/cpuinfo | grep "model name" | sed -e 's/model name.*: //');
RAM=$(cat /proc/meminfo | grep MemTotal | sed -e 's/MemTotal:\s*//');
KERNEL=$(uname -s -r);
DISTR_FILE=$(find /etc -maxdepth 1 -type f -regex '/etc/.*\(version\|release\).*' | head -n 1);
if [ ! -z "$DISTR_FILE" ]; then
DISTR_NAME=$( ( echo $DISTR_FILE | sed -e 's/\/etc\/\(.*\).version/\1/') 2>/dev/null);
DISTR_VER=$(cat $DISTR_FILE 2>/dev/null);
fi
DEVICES=$(find /dev -maxdepth 1 -regex '/dev/[hs]d[a-z]')
NETCARD=$(lspci | grep -e 'Ethernet controller' | sed -e 's/.*Ethernet controller: //; s/(.*)$//;')

HOSTIP=$(ifconfig | grep -e 'inet addr' | sed '
         s/Bcast:[^ ]*//;
         s/P-t-P:[^ ]*//;
         s/\(inet addr:[^ ]*\)\s*\(.*\)/\1 \2/;
         s/inet addr/Addr/;
         s/^\s*//;
         s/\s+/ /')
HOSTGW=$(route | grep -e 'default' | awk '{ print $2; }')
USERS=$(cat /etc/passwd | grep -e 'bash$' | sed -e 's/\(\w*\).*/\1/;');
for i in $USERS; do
  USERLIST="$USERLIST$i "
done

GCCVER=$(gcc --version 2>/dev/null | grep -e 'gcc')
GPPVER=$(g++ --version 2>/dev/null | grep -e 'g++')
JAVAVER=$(java --version 2>&1 | grep -e 'java version')
if [ -z "$JAVAVER" ]; then
  JAVAVER=$(java -version 2>&1 | grep -e 'java version')
fi
PERLVER=$(perl --version | grep -e 'is perl' | sed -e 's/.*is perl, \([^ ]*\).*/\1/;')
PSQLVER=$(psql --version | head -n 1 | sed -e 's/.* \(.*$\)/\1/;')

echo "--HARDWARE"
echo "BIOS:                   $BIOS_VENDOR"
for i in $CPU; do
echo "CPU:                    $i"
done
echo "Motherboard:            $MB_VENDOR $MB_VERSION"
echo "RAM:                    $RAM"
for i in $NETCARD; do
echo "Network card:           $i"
done
for i in $DEVICES; do
DEVMODEL=$(hdparm -I ${i} 2>/dev/null | grep -e 'Model' | sed -e 's/^\s*Model Number:\s*//; s/\s*$//;')
DEVSIZE=$(fdisk -l ${i} 2>/dev/null | grep -e 'Disk /dev/' | sed -e 's/\s*Disk \/dev\/\w*:\s*//; s/, \w* bytes\s*$//;')
echo "Storage:                $DEVMODEL $DEVSIZE"
done
echo ""

echo "--SYSTEM"
echo "OS:                     $DISTR_NAME $DISTR_VER"
echo "Kernel:                 $KERNEL"
echo "Hostname:               $HOSTNAME"
for i in $HOSTIP; do
echo "Network address:        $i"
done
echo "Network gateway:        $HOSTGW"
echo ""
echo "Usernames:              $USERLIST"
echo ""

echo "--SOFTWARE"
echo "gcc:                    $GCCVER"
echo "g++:                    $GPPVER"
echo "Java:                   $JAVAVER"
echo "Perl:                   $PERLVER"
echo "PostgreSQL:             $PSQLVER"
