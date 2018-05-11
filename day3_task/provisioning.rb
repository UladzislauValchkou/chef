machine 'provisclient' do
  action :converge
  chef_enviroment 'chef-dev'
  chef-server {'http://192.168.56.10'}
  driver 'https://github.com/chef/chef-provisioning-vagrant'
  from_image '/home/student/vagrant/chef/centos-7.4-x86_64-minimal.box'
  role 'jbossrole'
  
end
