# configures AJP and blocks port 8080


# insert load ajp module to httpd.conf
ruby_block "insert_line" do
  block do
    file = Chef::Util::FileEdit.new("/etc/httpd/conf/httpd.conf")
    file.insert_line_if_no_match("LoadModule proxy_ajp_module modules/mod_proxy_ajp.so", "LoadModule proxy_ajp_module modules/mod_proxy_ajp.so")
    file.write_file
  end
end

bash 'refresh_tomcat_conf' do
  cwd ::File.dirname('/etc/httpd/conf.d/')
  code <<-EOH
    rm welcome.conf
    EOH
  only_if { ::File.exists?('welcome.conf') }
end

template '/etc/httpd/conf.d/tomcat.conf' do
  source 'tomcat.conf.erb'
  owner 'centos'
  group 'centos'
  mode '0755'
  variables({
     :fqdn => node[:fqdn],
     :hostname => node[:hostname]
  })
end

#restart tomcat to load ajp
service 'httpd' do
  action [:restart]
end