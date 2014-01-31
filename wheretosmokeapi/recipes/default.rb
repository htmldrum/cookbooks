#
# Cookbook Name:: wheretosmokeapi
# Recipe:: default
#
# Copyright 2014, M. Shanken Communications
#
# All rights reserved - Do Not Redistribute
#

# Creates log and cache dirs for the Kohana project.

directory "/srv/www/wheretosmokeapi/current/application/logs" do
  recursive true
  owner "www-data"
  group "www-data"
  mode "777"
end

directory "/srv/www/wheretosmokeapi/current/application/cache" do
  recursive true
  owner "www-data"
  group "www-data"
  mode "777"
end

