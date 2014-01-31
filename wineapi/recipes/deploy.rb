# Deploys the given git project to the deploy directory.
git "/var/www" do
  repository "git@github.com:mshanken/winedb-api.git"
  revision "devstable"
  action :sync
  user "root"
  group "root"
end


# Creates log and cache dirs for the Kohana project.

directory "/var/www/application/logs" do
  recursive true
  owner "www-data"
  group "www-data"
  mode "777"
end

directory "/var/www/application/cache" do
  recursive true
  owner "www-data"
  group "www-data"
  mode "777"
end

