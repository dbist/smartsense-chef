#
# Cookbook Name:: smartsense-chef
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

# copy smartsense package to /tmp directory
cookbook_file "/tmp/smartsense-hst_1.2.1-161_amd64.deb" do
   source "smartsense-hst_1.2.1-161_amd64.deb"
   mode "0770"	
end

# install smartsense package on a node
dpkg_package "/tmp/smartsense-hst_1.2.1-161_amd64.deb" do
  action :install	
end

# package dependencies

package "wget" do
end

package "sysstat" do
end

package "dstat" do
end

package "lsof" do
end

package "net-tools" do
end

package "python2.7" do
end
