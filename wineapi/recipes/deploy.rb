# Deploys the given git project to the deploy directory.
git "/var/www" do
  repository "https://github.com:mshanken/winedb-api.git"
  revision "devstable"
  action :sync
  user "root"
  group "root"
end
