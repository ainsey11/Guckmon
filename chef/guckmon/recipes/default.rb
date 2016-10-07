
# Cookbook Name:: guckmon
# Recipe:: default
#
# Copyright 2016, Ainsey11.com
#
# All rights reserved - Do Not Redistribute
#

execute "apt-get update" do
  command "apt-get update -y && apt-get upgrade -y"
end

package 'snmpd' do
  action :install
end

service 'snmpd' do
  action [ :enable, :start ]
end

cookbook_file "/etc/snmp/snmpd.conf" do
  source "snmpd.conf"
  mode "0644"
end

service 'snmpd' do
	action [:restart]
end


package 'htop' do
	action :install
end

package 'iftop' do
        action :install
end
package 'iotop' do
        action :install
end

package 'vim' do
        action :install
end

package 'iperf' do
        action :install
end

package 'git-core' do
        action :install
end

package 'upstart' do
        action :install
end

cookbook_file "/etc/update-motd.d/10-help-text" do
  source "10-help-text"
  mode "755"
end

cookbook_file "/opt/setup.sh" do
  source "setup.sh"
  mode 0755
end

cookbook_file "/etc/init.d/chef.sh" do
        source "chef.sh"
        mode "755"
end
execute 'run bash Commands' do
        user "root"
        command "bash /opt/setup.sh"
end
