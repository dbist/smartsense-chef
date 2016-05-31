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
end

describe 'smartsense-chef::smartsense_setup' do
  let(:chef_run) { ChefSpec::SoloRunner.converge(described_recipe) }

  it 'directory exists' do
    expect(chef_run).to create_directory('/etc/hst/conf/')
  end
end
