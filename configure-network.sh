echo "Configuring network"

sudo dhclient

filename="/etc/configuration/network-configuration.config"

configs=$(head -n 6 $filename)

#configure nameserver in /etc/resolv.conf

IFS=';' read -r -a props <<< $configs

IFS='=' read -r -a nameserver_property <<< ${props[0]}
echo "Nameserver that will be set is: ${nameserver_property[1]}"

myhost=${nameserver_property[0]}
myhost=$myhost" ${nameserver_property[1]}"
echo "final host is: " $myhost
echo "$myhost" > "/etc/resolv.conf"

myinterface="/etc/sysconfig/network-scripts/ifcfg-eth0"

echo "Configure eth0..."
echo "Cleaning $myinterface ..."
echo "" > $myinterface

echo "Writing data in $myinterface ..."

echo "" > "/etc/sysconfig/network-scripts/ifconfig-eth0"
echo ${props[1]} > $myinterface
echo ${props[2]} >> $myinterface
echo ${props[3]} >> $myinterface
echo ${props[4]} >> $myinterface
echo ${props[5]} >> $myinterface

echo "Properties written: "
cat $myinterface
