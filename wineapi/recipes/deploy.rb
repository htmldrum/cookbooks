# Deploys the given git project to the deploy directory.
git "/var/www/wineapi/" do
  repository "git@github.com:mshanken/winedb-api.git"
  revision "master"
  action :sync
  user "root"
  group "root"
end



# Creates log and cache dirs for the Kohana project.


directory "/var/www/wineapi" do
  recursive true
  owner "www-data"
  group "www-data"
  mode "755"
end

directory "/var/www/wineapi/application/logs" do
  recursive true
  owner "www-data"
  group "www-data"
  mode "777"
end

directory "/var/www/wineapi/application/cache" do
  recursive true
  owner "www-data"
  group "www-data"
  mode "777"
end

#
# Taken from:
# http://docs.aws.amazon.com/opsworks/latest/userguide/gettingstarted.walkthrough.photoapp.3.html
#
script "install_composer" do
  interpreter "bash"
  user "root"
  cwd "/var/www/wineapi"
  code <<-EOH
  curl -s https://getcomposer.org/installer | php
  php composer.phar install --no-dev --no-interaction --optimize-autoloader
  EOH
end
 
