echo "Installing git..."
sudo dhclient

sudo yum -y install git
echo "Installing vim..."

sudo yum -y install vim

echo "Utlilities job finished"
echo "Cloning repository"

echo "Set git configs in order to clone repos"
git config --global --unset http.proxy
git config --global --unset https.proxy

#test if directory is empty to clone the repo
if [ -z "$(ls -A /etc/my-repository)" ]; then
	echo "Local directory is empty...OK!"
else
	rm -rf "/etc/my-repository"
	echo "Directory not empty, cleaning ..."
fi
git clone "https://github.com/alexandrubodnar1996/mlmos.git" "/etc/my-repository"
echo "Repo cloned!"
