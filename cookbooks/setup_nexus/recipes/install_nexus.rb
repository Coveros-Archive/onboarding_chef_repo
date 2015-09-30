# install_jenkins.war
remote_file '/usr/local/nexus-2.11.4-01-bundle.tar.gz' do
  source 'http://download.sonatype.com/nexus/oss/nexus-2.11.4-01-bundle.tar.gz'
  owner 'nexusguy'
  group 'nexususers'
  action :create
end

bash 'untar_and_install_nexus' do
  cwd ::File.dirname('/usr/local')
  code <<-EOH
  	cd /usr/local
  	tar xvzf nexus-2.11.4-01-bundle.tar.gz
  	ln -s nexus-2.11.4-01 nexus

    EOH
  not_if { ::File.symlink?('/usr/local/nexus') }
end

bash 'change_permissions_and_ownership' do
  cwd ::File.dirname('/usr/local')
  code <<-EOH
  	cd /usr/local
  	chgrp -R nexususers nexus-2.11.4-01/
	chgrp -Rh nexususers nexus
	chgrp -R nexususers sonatype-work/
	chown -R nexusguy nexus-2.11.4-01/
	chown -Rh nexusguy nexus
	chown -R nexusguy sonatype-work/

    EOH
  only_if { ::File.symlink?('/usr/local/nexus') }
end



# not using this because it won't apply recursively to the subdirectories of these folders
# directory '/usr/local/nexus-2.11.4-01/' do
#   owner 'nexusguy'
#   group 'nexususers'
#   recursive true
#   action :create
# end

# directory '/usr/local/sonatype-work/' do
#   owner 'nexusguy'
#   group 'nexususers'
#   recursive true
#   action :create
# end

# directory '/usr/local/nexus' do
#   owner 'nexusguy'
#   group 'nexususers'
#   recursive true
#   action :create
# end


execute 'start_nexus' do
  command '/usr/local/nexus/bin/nexus start'
  user 'nexusguy'
end