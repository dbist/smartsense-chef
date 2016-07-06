require 'spec_helper'

RSpec.configure do |config|
  # Specify the Chef log_level (default: :warn)
  config.log_level = :warn

  # Specify the operating platform to mock Ohai data from (default: nil)
  config.platform = 'ubuntu'

  # Specify the operating version to mock Ohai data from (default: nil)
  config.version = '12.04'
end

describe 'smartsense-chef::default' do
  let(:chef_run) { ChefSpec::SoloRunner.converge(described_recipe) }

  it 'installs hst' do
    expect(chef_run).to install_dpkg_package("#{Chef::Config[:file_cache_path]}/smartsense-hst_1.2.2-0_amd64.deb")
  end

  it 'installs wget' do
    expect(chef_run).to install_package('wget')
  end

  it 'installs lsof' do
    expect(chef_run).to install_package('lsof')
  end

  it 'installs sysstat' do
    expect(chef_run).to install_package('sysstat')
  end

  it 'installs dstat' do
    expect(chef_run).to install_package('dstat')
  end

  it 'installs net-tools' do
    expect(chef_run).to install_package('net-tools')
  end

  it 'installs python2.7' do
    expect(chef_run).to install_package('python2.7')
  end
end

describe 'smartsense-chef::smartsense_setup' do
  let(:chef_run) { ChefSpec::SoloRunner.converge(described_recipe) }

  it 'hst conf directory exists' do
    expect(chef_run).to create_directory('/etc/hst/conf/')
  end

  it 'hst-server.ini file exists' do
    expect(chef_run).to create_template('/etc/hst/conf/hst-server.ini')
  end

# it 'smartsense-hst pakage installed' do
#   expect(chef_run).to create_remote_file_if_missing("#{Chef::Config[:file_cache_path]}/smartsense-hst_1.2.2-0_amd64.deb")
#    expect(chef_run).to create_remote_file_if_missing("/tmp/smartsense-hst_1.2.2-0_amd64.deb")
#   expect(chef_run).to install_dpkg_package('smartsense-hst')
# end

  it 'smartsense-hst pakage installed' do
    expect(chef_run).to install_dpkg_package('smartsense-hst')
  end
end

describe 'smartsense-chef::smartsense_gateway' do
  let(:chef_run) { ChefSpec::SoloRunner.converge(described_recipe) }

  it 'hst-gateway.ini file exists' do
    expect(chef_run).to create_template('/etc/hst/conf/hst-gateway.ini')
  end
end
