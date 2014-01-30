#
# Cookbook Name:: development
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

group node['developer']['group']

user node['developer']['user'] do
  comment "James Meldrum <james@htmldrum.com>"
  group node['developer']['group']
  system true
  shell node['developer']['shell'] # /usr/bin/zsh - requires zsh to be configured
end

# rbenv
include_recipe "rbenv::default"
include_recipe "rbenv::ruby_build"
include_recipe "rbenv::rbenv_vars"

rbenv_ruby "1.9.3-p194" # LWRP
rbenv_gem "bundler" do
    ruby_version "1.9.3-p194"
end
