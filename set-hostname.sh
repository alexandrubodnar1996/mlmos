echo "Configuring hostname..."
line=""

filename="/etc/configuration/host.config"
if [[ -w $filename && -r $filename ]]; then
	echo 'Reading configuration file'
	line=$(head -n 1 $filename)
	echo "hostname from config: $line"
else
	echo "Setting permission in order to read the file"
	result2=$(sudo chmod +r $filename)
	if [ result != '' ]; then
		echo "File owned"
	fi
fi

IFS='=' read -r -a fields <<< $line
myhostname=${fields[1]}

result=$(sudo hostnamectl set-hostname $myhostname)

if [ result != '' ]; then
	echo "Execution finished"
fi

echo "New hostname is: $(hostname)"
