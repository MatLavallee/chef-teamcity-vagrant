include_recipe 'apt'

deb_path = '/tmp/vagrant.deb'

remote_file deb_path do
  source 'http://files.vagrantup.com/packages/7e400d00a3c5a0fdf2809c8b5001a035415a607b/vagrant_1.2.2_x86_64.deb'
  checksum '3983c7987ff64d8313a33658bb6364c80be0f35d'
  mode 0777
end

dpkg_package deb_path do
  action :install
end
