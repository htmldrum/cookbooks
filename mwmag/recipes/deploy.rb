# Deploys the given git project to the deploy directory.
git "/tmp/" do
  repository "git@github.com:mshanken/mwmag.git"
  revision "prod"
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

# Running dependency isntalls.
script "install_npm_dependencies" do
  interpreter "bash"
  user "root"
  cwd "/srv/www/wordpress/current/wp-content"
  code <<-EOH
  npm install && bower install && gulp
  EOH
end
