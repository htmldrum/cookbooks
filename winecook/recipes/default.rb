#
# Cookbook Name:: winecook
# Recipe:: default
#
# Copyright (C) 2014 M. Shanken Communications
# 
# All rights reserved - Do Not Redistribute
#
#
include_recipe "apt"
include_recipe "php"
include_recipe "composer"

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

composer_project "/var/www" do
  dev false
  quiet true
  action :install
end


#php_pear_channel "pear.symfony.com" do
#  action :discover
#end

#ac = php_pear_channel "pear.amazonwebservices.com" do
#  action :discover
#end

#gc = php_pear_channel "guzzlephp.org/pear" do
#  action :discover
#end

#php_pear "Guzzle" do
#  channel gc.channel_name
#  package_name "Guzzle"
#  action :install
#end

#php_pear "aws/sdk" do
#  channel ac.channel_name
#  package_name "sdk"
#  version "1.5.5"
#  action :install
#end
