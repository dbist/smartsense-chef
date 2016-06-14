#
# Cookbook Name:: smartsense-chef
# Recipe:: default
#
# Copyright (c) 2016 Artem Ervits, All Rights Reserved.

include_recipe "smartsense-chef::smartsense_setup"

remote_file "#{Chef::Config[:file_cache_path]}/smartsense-hst_#{node['smartsense-chef']['smartsense_version']}.deb" do
   source "#{node['smartsense-chef']['repo_url']}/smartsense-hst_#{node['smartsense-chef']['smartsense_version']}.deb"
   mode '0770'
   action :create_if_missing
   checksum node['smartsense-chef']['checksum']
   not_if { node['smartsense-chef']['use_local_repo'] }
end

# install smartsense package on a node
dpkg_package "#{Chef::Config[:file_cache_path]}/smartsense-hst_1.2.2-0_amd64.deb" do
  action :install	
end

# package "smartsense-hst" do
#    action :install
#    version '1.2.2-0_amd64'
#    provider Chef::Provider::Package::Apt
# end

# SmartSense results are more accurate with the following dependencies installed
%w{wget sysstat dstat lsof net-tools python2.7}.each do |pkg|
   package pkg do
   end
end
