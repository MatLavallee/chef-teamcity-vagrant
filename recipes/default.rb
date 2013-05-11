#
# Cookbook Name:: .
# Recipe:: default
#
# Copyright (C) 2013 YOUR_NAME
# 
# All rights reserved - Do Not Redistribute
#

%w[
  chef-teamcity-vagrant::vcs
  chef-teamcity-vagrant::teamcity
].each do |r|
  include_recipe r
end
