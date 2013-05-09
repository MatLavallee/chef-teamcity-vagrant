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
  chef-teamcity-vagrant::mercurial-git
  chef-teamcity-vagrant::teamcity
  chef-teamcity-vagrant::vagrant
].each do |r|
  include_recipe r
end
