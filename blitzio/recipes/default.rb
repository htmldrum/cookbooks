#
# Cookbook Name:: blitz.io
# Recipe:: default
#
# Copyright (C) 2014 YOUR_NAME
# 
# All rights reserved - Do Not Redistribute
#

template "/var/www/wineapi/web/mu-79d650c0-34ab024a-0c011143-8d223b6f.txt" do
  source "mu-79d650c0-34ab024a-0c011143-8d223b6f.txt.erb"
  owner "root"
  group "root"
  mode "644"
end
