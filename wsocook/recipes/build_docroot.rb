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
