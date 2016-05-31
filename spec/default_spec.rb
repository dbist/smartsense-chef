require 'spec_helper'

RSpec.configure do |config|
  # Specify the Chef log_level (default: :warn)
  config.log_level = :warn

  # Specify the operating platform to mock Ohai data from (default: nil)
  config.platform = 'ubuntu'

  # Specify the operating version to mock Ohai data from (default: nil)
  config.version = '12.04'
end

describe 'smartsense-chef::smartsense_setup' do
  let(:chef_run) { ChefSpec::SoloRunner.converge(described_recipe) }

  it 'installs hst' do
    expect(chef_run).to install_dpkg_package('smartsense-hst').with_version('1.2.1')
  end
end
