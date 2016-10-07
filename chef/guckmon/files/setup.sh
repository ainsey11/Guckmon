
#sets permissions on motd
chmod +x /etc/update-motd.d/10-help-text

#makes right dir
mkdir -p /opt/

#changes into new dir
cd /opt/

#gets latest copy of my github repo
git clone https://github.com/ainsey11/Guckmon


#enable chef-client on startup
sed -i '13s/.*/^Cef-client -i  1800 /' /etc/rc.local

# runs updates, for the sake of being tidy
sudo apt-get update -y
sudo apt-get upgrade -y
