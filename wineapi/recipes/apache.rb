template "/etc/apache2/sites-enabled/000-default.conf" do
  source "000-default.conf.erb"
  owner "root"
  group "root"
  mode "644"
end


service "apache2" do
  action :restart
end
