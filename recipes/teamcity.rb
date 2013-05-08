#
# Cookbook Name:: chef-teamcity-install
# Recipe:: default
#
# Copyright (C) 2013 YOUR_NAME
# 
# All rights reserved - Do Not Redistribute
#

#teamcity_user = 'teamcity'
version = node['teamcity']['version']
install_dir = node['teamcity']['install_dir']
install_path = File.join install_dir, 'TeamCity'
data_path = node['teamcity']['data_path']

# Install Java
include_recipe 'java::oracle'

## Create user
#user teamcity_user do
#  comment 'User running TeamCity'
#  home install_path
#  shell '/bin/bash'
#end

# Download Teamcity
download_path = File.join install_dir, "TeamCity-#{version}.tar.gz"

remote_file download_path do
  source "http://download.jetbrains.com/teamcity/TeamCity-#{version}.tar.gz"
  action :create_if_missing
end

# Unpack
execute 'Unpack package' do
  command "tar -xvzf #{download_path} --directory \"#{install_dir}\""
  creates install_path
end

## Change install and data directories owner and group
#[install_path, data_path].each do |dir|
#  directory dir do
#    owner teamcity_user
#    group teamcity_user
#    recursive true
#  end
#  execute "Change owner of #{dir}" do
#    command "chown -R #{teamcity_user} #{dir}"
#    only_if { ::File.exists?(dir) }
#  end
#  execute "Change group of #{dir}" do
#    command "chgrp -R #{teamcity_user} #{dir}"
#    only_if { ::File.exists?(dir) }
#  end
#end

# Install as a service
template '/etc/init.d/teamcity' do
  source 'teamcity_service_script.sh.erb'
  variables(
      :teamcity_data_path => data_path,
      :teamcity_path => install_path,
      #:user => teamcity_user
  )
  owner 'root'
  group 'root'
  mode 0755
end

# Start service
service 'teamcity' do
  action [:enable, :start]
end
