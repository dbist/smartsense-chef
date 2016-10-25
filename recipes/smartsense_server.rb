#
# Cookbook Name:: smartsense-chef
# Recipe:: smartsense_setup
#
# Copyright (c) 2016 Artem Ervits, All Rights Reserved.

execute 'hst start' do
  # only_if 'template "#{config_dir}/hst-server.ini"'
  command 'hst start'
end
