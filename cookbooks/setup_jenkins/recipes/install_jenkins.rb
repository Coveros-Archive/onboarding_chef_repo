# install_jenkins.war
remote_file '/var/lib/tomcat/webapps/jenkins.war' do
  source 'https://updates.jenkins-ci.org/latest/jenkins.war'
  owner 'centos'
  group 'centos'
  action :create
end

#restart tomcat to expand war file
service 'tomcat' do
  action [:restart]
end