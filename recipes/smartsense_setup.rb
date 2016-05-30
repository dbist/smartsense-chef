#
# Cookbook Name:: smartsense-chef
# Recipe:: smartsense_setup
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

package "smartsense-hst" do
   :nothing
end

#service "smartsense-hst" do
#   action [ :enable , :start ]
#end

template "/etc/hst/conf/hst-server.ini" do
   source 'hst-server.ini.erb'
   mode '0644'
end
