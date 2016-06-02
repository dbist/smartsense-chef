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
    expect(chef_run).to install_dpkg_package('/tmp/smartsense-hst_1.2.1-161_amd64.deb')
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

  it 'directory exists' do
    expect(chef_run).to create_directory('/etc/hst/conf/')
  end
end
