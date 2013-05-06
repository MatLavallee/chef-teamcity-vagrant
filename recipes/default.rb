#
# Cookbook Name:: .
# Recipe:: default
#
# Copyright (C) 2013 YOUR_NAME
# 
# All rights reserved - Do Not Redistribute
#

%w[
  chef-teamcity-vagrant::heroku
  chef-teamcity-vagrant::vcs
  chef-teamcity-vagrant::mercurial-git
  chef-teamcity-vagrant::ruby
  chef-teamcity-vagrant::teamcity
  chef-teamcity-vagrant::vagrant
  chef-teamcity-vagrant::virtualbox
].each do |r|
  include_recipe r
end