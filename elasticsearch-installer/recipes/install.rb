#
# Cookbook Name:: elasticsearch-installer
# Recipe:: default
#
# Copyright 2014, M. Shanken Communications
# Author: Sergey Zhukov
# szhukov@mshanken.com
#
# All rights reserved - Do Not Redistribute
#


#Install the ORACLE jre environment for elasticsearch.

execute "install ORACLE java" do
	command "sudo add-apt-repository -y ppa:webupd8team/java && sudo apt-get update && sudo echo debconf shared/accepted-oracle-license-v1-1 select true | sudo debconf-set-selections && sudo echo debconf shared/accepted-oracle-license-v1-1 seen true | sudo debconf-set-selections && sudo apt-get -y install oracle-java7-installer oracle-java7-set-default"
	action :run
end


#Getting the elastcisearch executable. 

execute "wget deb package" do
	cwd "/tmp"
        command "wget https://download.elasticsearch.org/elasticsearch/elasticsearch/elasticsearch-1.3.2.deb"
        action :run
end

#Installing the actual deb package.

execute "install with dpkg" do
        cwd "/tmp"
        command "sudo dpkg -i elasticsearch-1.3.2.deb"
        action :run
end


#Enabling elastic search to start

execute "start elasticsearch" do
        command "sudo service elasticsearch start"
        action :run
end
