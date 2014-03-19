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
