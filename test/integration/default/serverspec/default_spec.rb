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

 it ' hst server responds on port 9000' do
   expect(port 9000).to be_listening 'tcp'
 end

 describe command('hst start') do
  its(:exit_status) { should eq 0 }
 end

 # gateway specific tests will only pass if gateway is converged
# describe file('/etc/hst/conf/hst-gateway.ini') do
#   it { should exist }
# end

# it 'hst gateway responds on port 9451' do
#   expect(port 9451).to be_listening 'tcp'
# end

# describe command('hst gateway start') do
#  its(:exit_status) { should eq 0 }
# end

 # agent specific tests
 describe file('/etc/hst/conf/hst-agent.ini') do
   it { should exist }
 end

 it 'hst agent responds on port 9440' do
   expect(port 9440).to be_listening 'tcp'
 end

 describe command('hst agent-status') do
   its(:stdout) { should contain('registered') }
 end

 describe command('hst list-agents') do
   its(:stdout) { should contain('default-ubuntu-1404') }
 end
end
