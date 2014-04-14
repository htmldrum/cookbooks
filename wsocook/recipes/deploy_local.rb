template "/etc/apache2/sites-enabled/default" do
    source "default.erb"
end

%w{/var/www/cache /var/www/log /var/www/content-cache}.each do |mkdir|
  directory mkdir do
    mode 0777
    action :create
  end
end

bash "touch content_cache.lock" do
  code <<-EOH
  touch content_cache.lock
  chmod 777 content_cache.lock
  EOH
end

bash "fix symfony permissions" do
  code <<-EOH
  cd /var/www
  symfony fix-perms
  EOH
end

service "apache2" do
  action :restart
end
