template "/var/www/wineapi/application/config/cache.php" do
  source "cache.php.erb"
  owner "root"
  group "root"
  mode "644"
end
