remote_file '/opt/jboss/server/default/deploy/sample.war' do
  source "#{node['application_repo']}"
end
 
