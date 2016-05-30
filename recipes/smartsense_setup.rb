#
# Cookbook Name:: smartsense-chef
# Recipe:: smartsense_setup
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

# template requires a directory created
config_dir = "#{node['smartsense-chef']['deploy_to']}"

directory config_dir do
  recursive true
end

template "/etc/hst/conf/hst-server.ini" do
   source 'hst-server.ini.erb'
   mode '0644'
end

# execute "hst start" do
#   command "hst start"
# end
