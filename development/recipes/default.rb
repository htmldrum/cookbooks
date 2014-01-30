#
# Cookbook Name:: development
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

group node.default['developer']['group']

user node.default['developer']['user'] do
  action :create

  comment "James Meldrum <james@htmldrum.com>"
  group node.default['developer']['group']
  shell node.default['developer']['shell'] # /usr/bin/zsh - requires zsh to be configured
end

# rbenv
include_recipe "rbenv::default"
include_recipe "rbenv::ruby_build"
include_recipe "rbenv::rbenv_vars"

rbenv_ruby node.default['developer']['ruby_version'] # LWRP
rbenv_gem "bundler" do
    ruby_version node.default['developer']['ruby_version']
end
