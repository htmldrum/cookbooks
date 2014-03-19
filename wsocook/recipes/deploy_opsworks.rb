template "/etc/apache2/sites-enabled/wso" do
  source "wso.erb"
end

git "/var/www/wso/" do
  repository "git@github.com:mturro/wso.git"
  revision "wsocook"
  action :sync
  user "root"
  group "root"
end

remote_file "aws_config" do
  path "/usr/share/php/AWSSDKforPHP/config.inc.php"
  source "file:///var/www/wso/data/config.inc.php"
  owner 'root'
  group 'root'
  mode 0755
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

service "apache2" do
  action :restart
end
