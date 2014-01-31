#
# Cookbook Name:: wineapi
# Recipe:: default
#
# Copyright 2014, M Shanken Communications
#
# All rights reserved - Do Not Redistribute
#

# Creates deploy directory with correct permissions.
directory "/var/www" do
  recursive true
  owner "www-data"
  group "www-data"
  mode "755"
end

# Creates log and cache dirs for the Kohana project.

directory "/var/www/application/log" do
  recursive true
  owner "www-data"
  group "www-data"
  mode "755"
end

directory "/var/www/application/cache" do
  recursive true
  owner "www-data"
  group "www-data"
  mode "755"
end
