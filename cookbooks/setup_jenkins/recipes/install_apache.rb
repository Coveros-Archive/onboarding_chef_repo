# install apache
yum_package 'httpd' do
	options "-y"
end

service 'httpd' do
  action [:enable, :start]
end