#
# Cookbook Name:: managewine
# Recipe:: default
#
# Copyright (C) 2014 YOUR_NAME
#
# All rights reserved - Do Not Redistribute
#

script "get_env_vars" do
  interpreter "bash"
  user "root"
  cwd "/srv/www/managewine/current/"
  code <<-EOH
  source . .env
  EOH
end


script "provision project" do
  interpreter "bash"
  user "root"
  cwd "/srv/www/managewine/current/"
  code <<-EOH
  ./provision.sh
  EOH
end
