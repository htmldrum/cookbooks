template "/etc/apache2/sites-enabled/default" do
  source "wso.erb"
end

git "/var/www/" do
  repository "git@github.com:mturro/wso.git"
  revision "wsocook"
  action :sync
  user "root"
  group "root"
end
