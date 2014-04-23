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

%w{git-core apache2 libapache2-mod-php5 php5 php5-mysql php5-curl php-pear php5-memcache sphinxsearch memcached php-apc build-essential}.each do |pkg|
 package pkg do
   action :install
 end
end

execute "a2enmod rewrite" do
   command "sudo a2enmod rewrite"
end

execute "a2enmod ssl" do
  command "sudo a2enmod ssl"
end

sc = php_pear_channel "pear.symfony-project.com" do
 action :discover
end

%w{EventDispatcher pake YAML}.each do |pear|
  php_pear pear do
    channel sc.channel_name
    action :install
  end
end

php_pear "symfony" do
  channel sc.channel_name
  version "1.0.22"
  action :install
end

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
