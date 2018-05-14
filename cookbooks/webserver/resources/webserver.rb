resource_name :web_server
property :role, String, default: 'jbossrole'
property :detach_srv, String, default: '0.0.0.0'

action :attach do
  result = ""
  search(:node, 'role:jbossrole').each do |node|
    result += "server #{node[:network][:interfaces][:enp0s8][:addresses].detect{|k,v| v[:family] == 'inet' }.first}:8090;"
  end

  ip_addr = node[:network][:interfaces][:enp0s8][:addresses].detect{|k,v| v[:family] == 'inet' }.first
  template '/etc/nginx/nginx.conf' do
    source "nginx.conf.erb"
    variables( 
      srv_list: result,
      srv_nginx: ip_addr
    )
  end

  service 'nginx' do
    action [:restart]
  end
end

action :detach do
  bash 'delete' do
    code <<-EOH
      sed -i '/#{detach_srv}/d' /etc/nginx/nginx.conf
      EOH
  end
  service 'nginx' do
    action [:restart]
  end
end
