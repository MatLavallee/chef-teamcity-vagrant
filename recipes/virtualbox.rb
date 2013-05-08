include_recipe 'apt'

%w[
  virtualbox
  virtualbox-dkms
  virtualbox-ose-dkms
].each do |pkg|
  package pkg do
    notifies :run, 'execute[reconfigure-virtualbox]'
  end
end

execute 'install-headers' do
  command 'apt-get -y install linux-headers-$(uname -r)'
end

execute 'reconfigure-virtualbox' do
  command 'dpkg-reconfigure virtualbox-dkms virtualbox'
  action :nothing
end

