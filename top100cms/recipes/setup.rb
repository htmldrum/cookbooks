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
