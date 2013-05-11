include_recipe 'chef-teamcity-vagrant::vagrant'

package 'build-essential'

execute 'vagrant plugin install vagrant-aws'