# Deploys the given git project to the deploy directory.
git "/srv/www/wordpress/current/wp-content" do
  repository "git@github.com:mshanken/mwmag.git"
  revision "master"
  action :sync
  user "root"
  group "root"
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
