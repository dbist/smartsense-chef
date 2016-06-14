#
# Cookbook Name:: smartsense-chef
# Recipe:: smartsense_setup
#
# Copyright (c) 2016 Artem Ervits, All Rights Reserved.

# template requires a directory created
config_dir = node['smartsense-chef']['deploy_to']

directory config_dir do
  recursive true
end

template "#{config_dir}/hst-server.ini" do
   source 'hst-server.ini.erb'
   mode '0644'
end

execute 'hst start' do
  command 'hst start'
  action :nothing
end
