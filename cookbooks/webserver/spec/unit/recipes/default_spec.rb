#
# Cookbook:: webserver
# Spec:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.

require 'spec_helper'

describe 'webserver::default' do
  let(:chef_run) do
    runner = ChefSpec::ServerRunner.new(platform: 'centos', version: '7.4.1708').converge(described_recipe)
  end

  it 'converges successfully' do
    expect { chef_run }.to_not raise_error
  end

  it 'nginx installed' do
    expect(chef_run).to install_package 'nginx'
  end

  it 'nginx enabled' do
    expect(chef_run).to enable_service 'nginx'
  end

  it 'nginx started' do
    expect(chef_run).to start_service 'nginx'
  end
end

