# Deploys the given git project to the deploy directory.
git "/var/www/identity/" do
  repository "git@github.com:mshanken/identity-api.git"
  revision "master"
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

#Setting db values

template "/var/www/identity/application/config/database.php" do
  source "database.php.erb"
  owner "root"
  group "root"
  mode "644"
end

#Setting identity values

template "/var/www/identity/application/config/identity.php" do
  source "identity.php.erb"
  owner "root"
  group "root"
  mode "644"
end

#Setting metamodel values

template "/var/www/identity/application/config/metamodel.php" do
  source "metamodel.php.erb"
  owner "root"
  group "root"
  mode "644"
end

#Setting metamodeluser values

template "/var/www/identity/application/config/metamodeluser.php" do
  source "metamodeluser.php.erb"
  owner "root"
  group "root"
  mode "644"
end

#Setting test values

template "/var/www/identity/application/config/test.php" do
  source "test.php.erb"
  owner "root"
  group "root"
  mode "644"
end

#Adding minion subscription checking crontab

cron "minion subscription tasks checker" do
  minute "7"
  day "*"
  command "/var/www/identity/tools/minion checkreceipts"
  action: create
end
