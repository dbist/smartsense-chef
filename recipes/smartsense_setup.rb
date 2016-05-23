#
# Cookbook Name:: smartsense-chef
# Recipe:: smartsense_setup
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

bash "hst setup" do
   user 'root'
   code <<-EOH
   "#{node['smartsense-chef']['account']}"
   "#{node['smartsense-chef']['id']}"
   "#{node['smartsense-chef']['email']}"
   "#{node['smartsense-chef']['directory']}"
   "#{node['smartsense-chef']['port']}"
   "#{node['smartsense-chef']['certificate']}"
   "#{node['smartsense-chef']['java_home']}"
   "#{node['smartsense-chef']['cluster_name']}"
   "#{node['smartsense-chef']['secured']}"
   EOH
end
