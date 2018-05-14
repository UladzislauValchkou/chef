#
# Cookbook:: jboss
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.
#

include_recipe 'java'
package 'unzip'

# creating jboss user
user 'jboss' do
  uid '1212'
  shell '/bin/bash'
end

# downloading jboss archive
remote_file './jboss.zip' do
  source 'https://kent.dl.sourceforge.net/project/jboss/JBoss/JBoss-5.1.0.GA/jboss-5.1.0.GA.zip'
  show_progress true
end

# extracting archive to opt folder
bash 'unarchive' do
  code <<-EOH
    mkdir -p /opt/jboss
    unzip jboss.zip -d /opt
    cp -r /opt/jboss-5.1.0.GA/* /opt/jboss/
    rm -rf /opt/jboss-5.1.0.GA
    chown -R jboss:jboss /opt/jboss
    EOH
end

binding_port = data_bag_item('test', 'jboss_port')
template '/opt/jboss/server/default/deploy/jbossweb.sar/server.xml' do
  source 'server.xml.erb'
  owner 'jboss'
  group 'jboss'
  variables(
    binding_port: binding_port['binding_port']
  )
end

# creating jboss service
systemd_unit 'jboss.service' do
  content <<-EOU
  [Unit]
  Description=Jboss Application Server
  After=network.target

  [Service]
  Type=forking

  User=jboss
  Group=jboss
  ExecStart=/bin/bash -c 'nohup /opt/jboss/bin/run.sh -b 192.168.56.20 &'
  ExecStop=/bin/bash -c 'bin/shutdown.sh -s 192.168.56.20 -u admin'
  TimeoutStartSec=300
  TimeoutStopSec=600
  SuccessExitStatus=143

  [Install]
  WantedBy=multi-user.target
  EOU
  action [ :create, :enable ]
end
