require 'spec_helper'

set :os , :family => 'ubuntu' , :release => 12.04

describe 'smartsense-chef::default' do
 it 'hst server is installed' do
   expect(package 'smartsense-hst').to be_installed
 end

 it 'dependency wget is installed' do
   expect(package 'wget').to be_installed
 end

 it 'dependency sysstat is installed' do
   expect(package 'sysstat').to be_installed
 end

 it 'dependency dstat is installed' do
   expect(package 'dstat').to be_installed
 end

 it 'dependency lsof is installed' do
   expect(package 'lsof').to be_installed
 end

 it 'dependency net-tools is installed' do
   expect(package 'net-tools').to be_installed
 end

 it 'dependency python2.7 is installed' do
   expect(package 'python2.7').to be_installed
 end

# tests whether oracle java 8 is installed
 describe file('/usr/lib/jvm/java-8-oracle-amd64') do
   it { should be_directory }
   it { should exist }
 end

 describe file('/etc/hst/conf/hst-server.ini') do
   it { should exist }
 end

 describe file('/etc/hst/conf/hst-gateway.ini') do
   it { should exist }
 end

 it 'responds on port 9000' do
   expect(port 9000).to be_listening 'tcp'
 end

 it 'responds on port 9451' do
   expect(port 9451).to be_listening 'tcp'
 end
end
