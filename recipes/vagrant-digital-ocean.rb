include_recipe 'chef-teamcity-vagrant::vagrant'

package 'build-essential'

execute 'install vagrant-digitalocean' do
  command 'vagrant plugin install vagrant-digitalocean'
  user 'teamcity'
  group 'teamcity'
  environment ({'HOME' => '/home/teamcity'})
end