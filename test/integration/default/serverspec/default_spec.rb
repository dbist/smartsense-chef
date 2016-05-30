require 'spec_helper'

describe 'smartsense-chef::default' do
  it 'hst server is installed' do
    expect(package 'smartsense-hst').to be_installed  
  end

  it 'responds on port "#{node[:smartsense-chef][:port]"' do
    expect(port 9000).to be_listening 'tcp'
  end
end
