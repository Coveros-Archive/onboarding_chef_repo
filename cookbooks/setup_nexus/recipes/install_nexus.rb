# install_jenkins.war
remote_file '/usr/local/nexus-2.11.1-01-bundle.tar.gz' do
  source 'http://download.sonatype.com/nexus/oss/nexus-2.11.1-01-bundle.tar.gz'
  owner 'nexusguy'
  group 'nexususers'
  action :create
end

bash 'untar_and_install_nexus' do
  cwd ::File.dirname('/usr/local')
  code <<-EOH
  	sudo tar xvzf nexus-2.11.4-01-bundle.tar.gz
  	sudo ln -s nexus-2.11.4-01 nexus
    EOH
  not_if { ::File.exists?('nexus') }
end

directory '/usr/local/nexususers nexus-2.11.4-01/' do
  owner 'nexusguy'
  group 'nexususers'
  recursive true
  action :create
end

directory '/usr/local/sonatype-work/' do
  owner 'nexusguy'
  group 'nexususers'
  recursive true
  action :create
end

directory '/usr/local/nexus' do
  owner 'nexusguy'
  group 'nexususers'
  action :create
end

bash 'start_nexus' do
  cwd ::File.dirname('/usr/local')
  code <<-EOH
  	sudo nexus/bin/nexus start
    EOH
  only_if { ::File.exists?('nexus') }
end