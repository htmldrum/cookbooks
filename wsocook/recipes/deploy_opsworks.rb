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

template "/etc/apache2/sites-enabled/000-default" do
  source "000-default.conf.erb"
  owner "root"
  group "root"
  mode "644"
end

git "/var/www/wso/" do
  repository "git@github.com:mturro/wso.git"
  revision "wsocook"
  action :sync
  user "root"
  group "root"
end

