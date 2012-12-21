include_recipe "hiphop_php"
include_recipe "mysql::server"

git "/var/www/drupal" do
  repository "http://git.drupal.org/project/drupal.git"
  reference "7.4"
  action :sync
end

cookbook_file "#{Chef::Config['file_cache_path']}/drupal-7.4-hiphop.patch" do
  source "drupal-7.4-hiphop-2011-06-30-a.diff"
  action :create_if_missing
end

execute "patch -p1 < #{Chef::Config['file_cache_path']}/drupal-7.4-hiphop.patch" do
  cwd "/var/www/drupal"
end

template "/etc/hhvm.hdf" do
  source "hhvm.hdf.erb"
end

directory "/var/log/hhvm" do
  owner "root"
  group "root"
  mode "0777"
end

execute 'sudo hhvm --config /etc/hhvm.hdf --user vagrant --mode daemon -v "Log.Level=Verbose" -v "Log.NoSilencer=on" -v "Log.Header=on"' do
  user "vagrant"
end
