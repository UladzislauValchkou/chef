#
# Cookbook:: jboss
# Spec:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.

require 'spec_helper'

describe 'jboss::default' do
  let(:chef_run) do
    runner = ChefSpec::SoloRunner.new(platform: 'centos', version: '7.4.1708').converge(described_recipe)
  end
  
  before do
    stub_data_bag_item("test", "jboss_port").and_return("id": "jboss_port", "binding_port": "8090")
  end

  it 'converges successfully' do
    expect { chef_run }.to_not raise_error
  end
  
  it 'user created' do
    expect(chef_run).to create_user('jboss')
  end

  it 'jboss service created' do
    expect(chef_run).to create_systemd_unit('jboss.service')
  end

  it 'jboss service enabled' do
    expect(chef_run).to enable_systemd_unit('jboss.service')
  end  
end


