include_recipe 'apt'

# Install headers
package 'linux-headers-3.2.0-23-generic-pae'

# Download virtualBox
deb_path = '/tmp/virtualbox.deb'
remote_file deb_path do
  source 'http://download.virtualbox.org/virtualbox/4.2.12/virtualbox-4.2_4.2.12-84980~Ubuntu~precise_i386.deb'
  mode 0777
end

# Install VirtualBox
dpkg_package deb_path do
  action :install
end


