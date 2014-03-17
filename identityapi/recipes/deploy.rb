# Deploys the given git project to the deploy directory.
git "/var/www/identity/" do
  repository "git@github.com:mshanken/identity-api.git"
  revision "devstable"
  action :sync
  enable_submodules true
  user "root"
  group "root"
end



# Creates log and cache dirs for the Kohana project.

directory "/var/www/identity/application/logs" do
  recursive true
  owner "www-data"
  group "www-data"
  mode "777"
end

directory "/var/www/identity/application/cache" do
  recursive true
  owner "www-data"
  group "www-data"
  mode "777"
end
