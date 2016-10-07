#sets permissions on motd
chmod +x /etc/update-motd.d/10-help-text

#makes right dir
mkdir -p /opt/

#changes into new dir
cd /opt/
rm -rf /opt/Guckmon
#gets latest copy of my github repo
git clone https://github.com/ainsey11/Guckmon
