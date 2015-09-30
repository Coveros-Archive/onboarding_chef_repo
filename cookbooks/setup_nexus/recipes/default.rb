#
# Cookbook Name:: setup_nexus
# Recipe:: default
#
# Copyright (c) 2015 The Authors, All Rights Reserved.
include_recipe 'setup_nexus::install_wget'
include_recipe 'setup_nexus::install_java'
include_recipe 'setup_nexus::create_user_and_group'
include_recipe 'setup_nexus::install_nexus'