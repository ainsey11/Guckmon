
#sets permissions on motd
chmod +x /etc/update-motd.d/10-help-text

#makes right dir
mkdir -p /opt/

#changes into new dir
cd /opt/

#gets latest copy of my github repo
git clone https://github.com/ainsey11/Guckmon


#creates a swapfile if there isnt one

# size of swapfile in megabytes
swapsize=2048

# does the swap file already exist?
grep -q "swapfile" /etc/fstab

# if not then create it
if [ $? -ne 0 ]; then
	echo 'swapfile not found. Adding swapfile.'
	fallocate -l ${swapsize}M /swapfile
	chmod 600 /swapfile
	mkswap /swapfile
	swapon /swapfile
	echo '/swapfile none swap defaults 0 0' >> /etc/fstab
else
	echo 'swapfile found. No changes made.'
fi

# output results to terminal
cat /proc/swaps
cat /proc/meminfo | grep Swap


#enable chef-client on startup
sed -i '13s/.*/^Cef-client -i  1800 /' /etc/rc.local

# runs updates, for the sake of being tidy
sudo apt-get update -y
sudo apt-get upgrade -y
