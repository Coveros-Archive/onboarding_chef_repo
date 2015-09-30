#
# Cookbook Name:: setup_nexus
# Recipe:: default
#
# Copyright (c) 2015 The Authors, All Rights Reserved.
include_recipe 'setup_jenkins::install_wget'
include_recipe 'setup_jenkins::install_java'
include_recipe 'setup_jenkins::create_user_and_group.rb'
include_recipe 'setup_jenkins::install_nexus'