#
# Cookbook Name:: smartsense-chef
# Recipe:: default
#
# Copyright (c) 2016 Artem Ervits, All Rights Reserved.

include_recipe 'smartsense-chef::setattr'

config_dir = node['smartsense-chef']['deploy_to']

filename = "#{Chef::Config[:file_cache_path]}/smartsense-hst_#{node['smartsense-chef']['smartsense_version']}.deb"
package_src = "#{node['smartsense-chef']['repo_url']}/smartsense-hst_#{node['smartsense-chef']['smartsense_version']}.deb"

# SmartSense results are more accurate with the following dependencies installed
%w(wget sysstat dstat lsof net-tools python2.7).each do |pkg|
  package pkg do
  end
end

remote_file filename do
  source package_src
  mode '0770'
  action :create_if_missing
  checksum node['smartsense-chef']['checksum']
  only_if { node['smartsense-chef']['use_local_repo'] }
end

# install smartsense package on a node
dpkg_package "#{Chef::Config[:file_cache_path]}/smartsense-hst_1.2.2-0_amd64.deb" do
  action :install
  only_if { node['smartsense-chef']['use_local_repo'] }	
end

apt_repository 'ambari' do
  uri node['smartsense-chef']['ambari_repo']
  components ['main']
  distribution 'Ambari'
  action :add

  # requires Chef 12.9
  keyserver 'keyserver.ubuntu.com'
  key 'B9733A7A07513CAD'

  not_if { node['smartsense-chef']['use_local_repo'] }
end

package 'smartsense-hst' do
  not_if { node['smartsense-chef']['use_local_repo'] }
  # version '1.2.2'
  # notifies :run, 'execute [hst start]', :immediately
end

include_recipe 'smartsense-chef::smartsense_setup'

# uncomment if you want to deploy smartsense server
include_recipe 'smartsense-chef::smartsense_server'

# uncomment if you want to deploy smartsense gateway
# include_recipe "smartsense-chef::smartsense_gateway"

# uncomment if you want to deploy smartsense agent
include_recipe 'smartsense-chef::smartsense_agent'
