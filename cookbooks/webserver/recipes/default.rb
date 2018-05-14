#
# Cookbook:: jboss
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.
#
package 'nginx'
 
service 'nginx' do
  action [ :enable, :start ]
end

