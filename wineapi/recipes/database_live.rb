template "/var/www/wineapi/application/config/database.php" do
  source "database_live.php.erb"
  owner "root"
  group "root"
  mode "644"
end
