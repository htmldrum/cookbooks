#
# Cookbook Name:: php55-msc
# Recipe:: default
#
# Copyright 2014, M. Shanken Communications
# Author: Sergey Zhukov
# szhukov@mshanken.com
#
# All rights reserved - Do Not Redistribute
#


execute "addapt" do
	command "sudo add-apt-repository ppa:ondrej/php5"
	action :run
end

execute "updateapt"  do
	command "sudo apt-get update"
	action :run
end

execute "installpy"  do
	command "sudo apt-get install python-software-properties"
	action :run
end

execute "updateapttwo"  do
	command "sudo apt-get update"
	action :run
end

execute "installphp55"  do
	command "sudo apt-get install php5"
	action :run
end
