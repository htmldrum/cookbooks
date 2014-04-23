template "/etc/apache2/sites-enabled/default" do
  source "default.erb"
  owner "root"
  group "root"
  mode "644"
end
