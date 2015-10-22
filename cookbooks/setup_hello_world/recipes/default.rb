#
# Cookbook Name:: setup_hello_world
# Recipe:: default
#
# Copyright (c) 2015 The Authors, All Rights Reserved.



# install tomcat
yum_package 'tomcat' do
	options "-y"
end

service 'tomcat' do
  action [:enable, :start]
end



# yum install wget
yum_package 'wget' do
	options "-y"
end

remote_file '/tmp/hello-world-sample-random-gen-1.0.2-rpm.rpm' do
  source 'http://ec2-54-210-118-101.compute-1.amazonaws.com:8081/nexus/service/local/repositories/releases/content/com/coveros/hello-world-sample-random-gen/1.0.2/hello-world-sample-random-gen-1.0.2-rpm.rpm'
  mode '0755'
  action :create
end

rpm_package 'hello-world-sample-random-gen-1.0.2-rpm' do
  action :install
  source '/tmp/hello-world-sample-random-gen-1.0.2-rpm.rpm'
end

bash 'restart_tomcat' do
  cwd ::File.dirname('/tmp')
  code <<-EOH
    service tomcat restart
    EOH
end
