#template "/etc/apache2/sites-enabled/000-default.conf" do
#  source "000-default.conf.erb"
#  owner "root"
#  group "root"
#  mode "644"
#end

execute "a2dissite default0000" do
 command "sudo a2dissite 000-default.conf"
end

execute "a2enmod ssl" do
 command "sudo a2enmod ssl"
end

execute "a2ensite default-ssl.conf" do
 command "sudo a2ensite default-ssl.conf"
end

template "/etc/apache2/sites-enabled/default-ssl.conf" do
  source "id.mshanken.comnew.erb"
  owner "root"
  group "root"
  mode "644"
end

template "/etc/apache2/ports.conf" do
  source "ports.conf.erb"
  owner "root"
  group "root"
  mode "644"
end

template "/etc/apache2/apache2.conf" do
  source "apache2.conf.erb"
  owner "root"
  group "root"
  mode "644"
end

execute "a2enmod rewrite" do
 command "sudo a2enmod rewrite"
end

service "apache2" do
  action :restart
end

