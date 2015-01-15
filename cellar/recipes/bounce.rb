#
# Cookbook Name:: cellar
# Recipe:: restart
#
# Copyright 2015, M. Shanken Communications
# Author: Sergey Zhukov <szhukov@mshanken.com>, James Meldrum
#         <jmeldrum@mshanken.com>
#
# All rights reserved - Do Not Redistribute
#
#
# Elasticsearch
# Nginx
# Worker queue
include_recipe "deploy"

node[:deploy].each do |application, deploy|

  if deploy[:application_type] != 'rails'
    Chef::Log.debug("Skipping deploy::rails-restart application #{application} as it is not a Rails app")
    next
  end

  execute "restart elasticsearch" do
    cwd deploy[:current_path]
    command "sudo service elasticsearch restart"
    action :run
    only_if do
      File.exists?(deploy[:current_path])
    end
  end

  execute "restart worker queue" do
    cwd deploy[:current_path]
    command "sudo service elasticsearch restart"
    action :run
    only_if do
      File.exists?(deploy[:current_path])
    end
  end

end
