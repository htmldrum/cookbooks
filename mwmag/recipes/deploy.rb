# Makes a Deploy directory.
directory "/tmp/mwmag/" do
  owner "root"
  group "root"
  mode 00644
  action :create
end



# Deploys the given git project to the deploy directory.
git "/tmp/mwmag" do
  repository "git@github.com:mshanken/mwmag.git"
  revision "master"
  action :sync
  user "root"
  group "root"
end


# Running an rsync to install the wp-content directory
script "run rsync" do
  interpreter "bash"
  user "root"
  cwd "/tmp/mwmag/"
  code <<-EOH
  rsync -rtv ./ /srv/www/wordpress/current/wp-content/
  EOH
end


#Adding proper node verson ppa.
execute "addapt" do
	command "add-apt-repository ppa:chris-lea/node.js"
	action :run
end


#Updating aptitude.
execute "update" do
        command "apt-get update"
        action :run
end


#Finally isntallign nodejs...
execute "install nodejs" do
        command "apt-get install nodejs"
        action :run
end


# Running dependency installs.
script "install_npm_dependencies" do
  interpreter "bash"
  user "root"
  cwd "/srv/www/wordpress/current/wp-content"
  code <<-EOH
  npm install && npm install bower && bower install --allow-root && npm install gulp
  EOH
end
