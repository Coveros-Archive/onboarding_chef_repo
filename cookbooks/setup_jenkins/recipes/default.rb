#
# Cookbook Name:: setup_jenkins
# Recipe:: default
#
# Copyright (c) 2015 The Authors, All Rights Reserved.
include_recipe 'setup_jenkins::install_wget'
include_recipe 'setup_jenkins::install_nano'
include_recipe 'setup_jenkins::install_java'
include_recipe 'setup_jenkins::install_tomcat'
include_recipe 'setup_jenkins::install_jenkins'
include_recipe 'setup_jenkins::install_apache'
include_recipe 'setup_jenkins::configure_ajp_block_8080'