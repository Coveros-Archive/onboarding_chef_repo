#
# Cookbook Name:: setup_hello_world
# Recipe:: default
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

package 'httpd'

service 'httpd' do
  action [:enable, :start]
end

file '/var/www/html/index.html' do
  content '<html>
  <body>
    <h1>Hello Coveros!!</h1>
  </body>
</html>'
end