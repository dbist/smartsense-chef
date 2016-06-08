#
# Cookbook Name:: smartsense-chef
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

include_recipe "smartsense-chef::smartsense_setup"

remote_file "#{Chef::Config[:file_cache_path]}/smartsense-hst_1.2.2-0_amd64.deb" do   
   source 'http://public-repo-1.hortonworks.com/ambari/ubuntu12/2.x/updates/2.2.2.0/pool/main/s/smartsense-hst/smartsense-hst_1.2.2-0_amd64.deb'
   mode '0770'
   checksum '0fc1d8058c4033d7a9b51e40e6c4a7bf'
   action :create_if_missing
end

# install smartsense package on a node
dpkg_package "#{Chef::Config[:file_cache_path]}/smartsense-hst_1.2.2-0_amd64.deb" do
  action :install	
end

# SmartSense results are more accurate with the following dependencies installed
%w{wget sysstat dstat lsof net-tools python2.7}.each do |pkg|
   package pkg do
   end
end
