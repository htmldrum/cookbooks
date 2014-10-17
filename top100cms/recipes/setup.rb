# Makes a Deploy directory.
directory "/tmp/wsot100/" do
  owner "root"
  group "root"
  mode 0755
  recursive true
  action :create
end


# Makes a theme Deploy directory.
directory "/srv/www/wordpress/current/wp-content/themes/top100/" do
  owner "root"
  group "root"
  mode 0755
  recursive true
  action :create
end


# Grab the code for the theme from github.
git "/tmp/wsot100" do
  repository "git@github.com:mshanken/Top100.git"
  revision "master"
  action :sync
  user "www-data"
  group "www-data"
end


# Rsync that theme over to the install dir.

script "run rsync" do
  interpreter "bash"
  user "root"
  cwd "/tmp/wsot100/"
  code <<-EOH
  rsync -atv ./ /srv/www/wordpress/current/wp-content/themes/top100/
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


# Installing static-press by hand since it is incompatible with composer.
execute "install static-press"  do
  cwd "/srv/www/wordpress/current/wp-content/plugins/"
  command "sudo wget https://downloads.wordpress.org/plugin/staticpress.0.4.3.5.zip && sudo unzip staticpress.0.4.3.5.zip"
  action :run
end


# Now adding the static html output directory for static-press plugin conifguration.
directory "/srv/www/wordpress/current/static_output/" do
  owner "root"
  group "root"
  mode 0755
  recursive true
  action :create
end


# Installing s3cmd CLI tool for syncing static content to s3.
execute "install s3cmd" do
  command "sudo apt-get install -y s3cmd"
  action :run
end


# Adding an s3cmd config file.
template "/home/ubuntu/.s3cfg" do
  source ".s3cfg.erb"
  owner "root"
  group "root"
  mode "644"
end
