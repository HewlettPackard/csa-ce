####################################################################################################
#	Author : Alex Dominic Savio								                                       #
#	Organization : Hewlett-Packard Enterprise						   							   #
#	Email : alex.william@hpe.com								   								   #
#												                                                   #
# Purpose:											                                               #
# This script gets the hostname and ipaddress as input through command line option.                #
# It automatically invokes the docker-compose up -d command to download				               #
# and spawn the HPE Cloud Service Automation CE  containers.							                               #
####################################################################################################

#!/bin/bash

hostname=$1
ipaddress=$2

if [ "$1" = "" ]; then
   echo USAGE:
   echo "sh buildEnv-dockercompose.sh <hostname> <ipaddress>"
   echo "\nThis script gets the hostname and ipaddress as input through command line option.\nIt automatically invokes the docker-compose up command to download and spawn containers"
   hostname=`hostname`
   ipaddress=`ifconfig eth0 2>/dev/null|awk '/inet addr:/ {print $2}'|sed 's/addr://'`
   echo "Possible value hostname = $hostname and ipaddress = $ipaddress"
   exit
fi

if [  -z "$hostname" -a "$hostname"=" " ]; then
echo "Please pass hostname as command line input"
echo USAGE:
echo "sh buildEnv-dockercompose.sh <hostname> <ipaddress>"

exit
fi

if [  -z "$ipaddress" -a "$ipaddress"=" " ]; then
echo "Please pass ipaddress as command line input"
echo USAGE:
echo "sh buildEnv-dockercompose.sh <hostname> <ipaddress>"
exit
fi

ping -q -c5 $ipaddress  > /dev/null

if [ $? -eq 0 ]
then
        echo "IPAddress : $ipaddress validation successfull"
else
        echo " Unable to reach $ipaddress"
        exit
fi
echo "The hostname is  $hostname"
echo "The ipaddress is $ipaddress"

if [ ! -z "$hostname" ] && [ "$hostname"!=" " ] && [ ! -z "$ipaddress" ] && [ "$ipaddress"!=" " ]; then
echo "Download docker-compose.yml file"
wget https://github.com/HewlettPackard/csa-ce/raw/master/docker-compose.yml --no-check-certificate
echo "Changing the  hostname and ipaddress in the yml file"
sed -i -e "s/vmhostname/${hostname}/" -e "s/vmipaddress/${ipaddress}/" docker-compose.yml
echo "Starting to download all the required images and the containers will be created in the backgroud. This may take sevaral minutes."
mkdir -p /src/share
docker-compose up -d

echo "Please note the below URLs for your reference"
echo "CSA Management Console - https://$ipaddress:18444/csa"
echo "MPP - https://$ipaddress:18089/mpp"
echo "Operations Orchestration Central - https://$ipaddress:18445/oo"

fi
