#!/bin/bash

#            ---------------------------------------------------
#                              Ghost Framework                                                  
#            ---------------------------------------------------
#                Fixed by <Jit Banerjee>
#
#        This program is free software: you can redistribute it and/or modify
#        it under the terms of the GNU General Public License as published by
#        the Free Software Foundation, either version 3 of the License, or
#        any later version.
#
#        This program is distributed in the hope that it will be useful,
#        but WITHOUT ANY WARRANTY; without even the implied warranty of
#        MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
#        GNU General Public License for more details.
#
#        You should have received a copy of the GNU General Public License
#        along with this program.  If not, see <http://www.gnu.org/licenses/>.

RS="\033[0;31m"
YS="\033[1;33m"
CE="\033[0m"

printf '\033]2;install.sh\a'

#blue start 
	BS="\033[1;34m"
#color end
	CE="\033[0m"
	C="\033[0m"
#red start
	RS="\033[0;31m"
#green start
	GN="\033[0;32m"
#white start
   WHS="\033[0m"

if [[ $EUID -ne 0 ]]
then
   sleep 1
   echo -e ""$GN"["$RS"+"$GN"]"$CE" This script must be run as root!"$C"" 1>&2
   sleep 1
   exit
fi

if [[ -d ~/ghost ]]
then
sleep 0
else
cd ~
{
git clone https://github.com/cehpoint/ghost.git
} &> /dev/null
fi
sleep 0.5
clear
sleep 0.5
cd ~/ghost
echo
cat banner/banner.txt
echo

sleep 1
echo -e ""$GN"["$RS"+"$GN"]"$CE" Installing dependencies..."$C""
sleep 1

{
pkg update
pkg -y install git
pkg -y install python
pkg -y install android-tools
apt-get update
apt-get -y install git
apt-get -y install python3
apt-get -y install adb
} &> /dev/null

{
cd ~/ghost/bin
cp ghost /usr/local/bin
chmod +x /usr/local/bin/ghost
cp ghost /bin
chmod +x /bin/ghost
} &> /dev/null

sleep 1
echo -e ""$GN"["$RS"+"$GN"]"$CE" Successfully installed!"$C""
sleep 1
