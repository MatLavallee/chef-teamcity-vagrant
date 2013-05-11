
teamcity_user = 'teamcity'
install_dir = node['teamcity']['install_dir']
install_path = File.join install_dir, 'TeamCity'
home_dir = install_path


template '~/.ssh/config' do
  source 'ssh_config.erb'
  variables(
      :heroku_projects => [],
      :teamcity_home => home_dir
  )
end