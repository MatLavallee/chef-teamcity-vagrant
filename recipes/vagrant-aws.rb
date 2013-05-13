include_recipe 'chef-teamcity-vagrant::vagrant'

package 'build-essential'

execute 'install vagrant-aws' do
  command 'vagrant plugin install vagrant-aws'
  user 'teamcity'
  group 'teamcity'
  environment ({'HOME' => '/home/teamcity'})
end