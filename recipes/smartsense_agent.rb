#
# Cookbook Name:: smartsense-chef
# Recipe:: smartsense_agent
#
# Copyright (c) 2016 Artem Ervits, All Rights Reserved.

# template requires a directory created
config_dir = node['smartsense-chef']['deploy_to']
hstserver = node['smartsense-chef']['hst_server']

directory config_dir do
  recursive true
end

template "#{config_dir}hst-agent.ini" do
   source 'hst-agent.ini.erb'
   mode '0644'
   subscribes :run, 'dpkg_package "#{Chef::Config[:file_cache_path]}/smartsense-hst_1.2.2-0_amd64.deb"'
end

execute 'hst setup-agent' do
  command "hst setup-agent --server=#{hstserver}"
end
