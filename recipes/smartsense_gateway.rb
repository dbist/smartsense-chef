#
# Cookbook Name:: smartsense-chef
# Recipe:: smartsense_gateway
#
# Copyright (c) 2016 Artem Ervits, All Rights Reserved.

# template requires a directory created
config_dir = node['smartsense-chef']['deploy_to']

directory config_dir do
  recursive true
end

template "#{config_dir}hst-gateway.ini" do
  source 'hst-gateway.ini.erb'
  mode '0644'
  subscribes :run, 'dpkg_package "#{Chef::Config[:file_cache_path]}/smartsense-hst_1.2.2-0_amd64.deb"'
end

execute 'hst gateway start' do
  # only_if 'template "#{config_dir}/hst-gateway.ini"'
  command 'hst gateway start'
end

execute 'hst restart' do
  # only_if 'template "#{config_dir}/hst-server.ini"'
  command 'hst restart'
end
