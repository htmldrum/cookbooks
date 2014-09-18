# Makes a Deploy directory.
directory "/tmp/mwmag/" do
  owner "root"
  group "root"
  mode 00755
  action :create
end


# Makes a theme Deploy directory.
directory "/srv/www/wordpress/current/wp-content/themes/marketwatch/" do
  owner "root"
  group "root"
  mode 00755
  action :create
end


# Deploys the given git project to the deploy directory.
git "/tmp/mwmag" do
  repository "git@github.com:mshanken/mwmag.git"
  revision "master"
  action :sync
  user "root"
  group "root"
end


# Running an rsync to install the wp-content directory
script "run rsync" do
  interpreter "bash"
  user "root"
  cwd "/tmp/mwmag/"
  code <<-EOH
  rsync -rtv ./ /srv/www/wordpress/current/wp-content/themes/marketwatch/
  EOH
end


# Adding composer'd plugins via template file.
template "/srv/www/wordpress/current/composer.json" do
  source "composer.json.erb"
  owner "root"
  group "root"
  mode "644"
end


# Taken from:
# http://docs.aws.amazon.com/opsworks/latest/userguide/gettingstarted.walkthrough.photoapp.3.html
script "install_composer" do
  interpreter "bash"
  user "root"
  cwd "/srv/www/wordpress/current/"
  code <<-EOH
  curl -s https://getcomposer.org/installer | sudo php
  sudo php composer.phar install --no-dev --no-interaction --optimize-autoloader
  EOH
end
