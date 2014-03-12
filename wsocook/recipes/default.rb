#
# Cookbook Name:: wsocook
# Recipe:: default
#
# Copyright (C) 2014 M. Shanken Communications
# 
# All rights reserved - Do Not Redistribute
#
#
include_recipe "apt"
include_recipe "php"
include_recipe "apache2"

#package "curl" do
#  action :install
#end

package "apache2" do 
  action :install
end

package "libapache2-mod-php5" do
  action :install
end

package "php5" do
  action :install
end

package "php5-mysql" do
  action :install
end

package "php5-curl" do
  action :install
end

package "php-pear" do
  action :install
end

package "php5-memcache" do
  action :install
end

service "apache2" do
  action :restart
end

package "sphinxsearch" do
  action :install
end

package "memcached" do
  action :install
end

package "php-apc" do
  action :install
end

package "build-essential" do
  action :install
end

sc = php_pear_channel "pear.symfony-project.com" do
 action :discover
end

php_pear "EventDispatcher" do
  channel sc.channel_name
  action :install
end

php_pear "pake" do
  channel sc.channel_name
  action :install
end

php_pear "YAML" do
 channel sc.channel_name
 action :install
end

php_pear "symfony" do
  channel sc.channel_name
  version "1.0.22"
  action :install
end

#composer_project "/var/www" do
#  dev false
#  quiet true
#  action :install
#end


php_pear_channel "pear.symfony.com" do
  action :discover
end

ac = php_pear_channel "pear.amazonwebservices.com" do
  action :discover
end

gc = php_pear_channel "guzzlephp.org/pear" do
  action :discover
end

#php_pear "Guzzle" do
#  channel gc.channel_name
#  package_name "Guzzle"
#  action :install
#end

php_pear "aws/sdk" do
  channel ac.channel_name
  package_name "sdk"
  version "1.5.5"
  action :install
end

remote_file "Copy aws config  file" do
  path "/usr/share/php/AWSSDKforPHP/config.inc.php"
  source "file:///var/www/data/config.inc.php"
  owner 'root'
  group 'root'
  mode 0755
end

web_app "default" do
  cookbook "wsocook"
  template "default.erb"
  server_name "localhost:8888"
  server_aliases ["localhost:8888"]
  docroot "/var/www/web"
end

directory "/var/www/cache" do
  mode 0777
  action :create
end

directory "/var/www/log" do
  mode 0777
  action :create
end

directory "/var/www/content-cache" do
  mode 0777
  action :create
end

bash "touch content_cache.lock" do
  code <<-EOH
  touch content_cache.lock
  chmod 777 content_cache.lock
  EOH
end

bash "fix symfony permissions" do
  code <<-EOH
  cd /var/www
  symfony fix-perms
  EOH
end
