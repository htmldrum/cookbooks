template "/etc/apache2/sites-enabled/000-default" do
  source "000-default.conf.erb"
  owner "root"
  group "root"
  mode "644"
end

node[:deploy].each do |application, deploy|
template "/etc/ssl/winespectator_com.crt" do
  mode 0600
  source 'ssl.key.erb'
  variables :key => deploy[:ssl_certificate]
  only_if do
    deploy[:ssl_support]
  end
end

template "/etc/ssl/winespectator_com.key" do
  mode 0600
  source 'ssl.key.erb'
  variables :key => deploy[:ssl_certificate_key]
  only_if do
    deploy[:ssl_support]
  end
end

template "/etc/ssl/winespectator_com.ca" do
  mode 0600
  source 'ssl.key.erb'
  variables :key => deploy[:ssl_certificate_ca]
  only_if do
    deploy[:ssl_support] && deploy[:ssl_certificate_ca]
  end
end
end

git "/var/www/wso/" do
  repository "git@github.com:mturro/wso.git"
  revision "wsocook"
  action :sync
  user "root"
  group "root"
end

%w{/var/www/wso/cache /var/www/wso/log /var/www/wso/content-cache}.each do |mkdir|
  directory mkdir do
    mode 0777
    action :create
  end
end

bash "touch content_cache.lock" do
  code <<-EOH
  cd /var/www/wso
  touch content_cache.lock
  chmod 777 content_cache.lock
  EOH
end

bash "fix symfony permissions" do
  code <<-EOH
  cd /var/www/wso
  symfony fix-perms
  EOH
end

db = data_bag_item("wso", "sandbox_dburi")
uri = db['dburi']

template "/var/www/wso/lib/SysConfig.config.php" do
  source "SysConfig.config.php.erb"
  variables :dburi => uri
end

service "apache2" do
  action :restart
end
