# install tomcat
yum_package 'tomcat' do
	options "-y"
end

service 'tomcat' do
  action [:enable, :start]
end

