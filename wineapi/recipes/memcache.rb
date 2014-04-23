template "/var/www/wineapi/application/config/memcache.php" do
  source "memcache.php.erb"
  owner "root"
  group "root"
  mode "644"
end
