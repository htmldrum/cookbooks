# Grab the code for the theme from github.
git "/tmp/wsot100" do
  repository "git@github.com:mshanken/Top100.git"
  revision "ad-unit-fix"
  action :sync
  user "root"
  group "root"
end


# Rsync that theme over to the install dir.

script "run rsync" do
  interpreter "bash"
  user "root"
  cwd "/tmp/wsot100/"
  code <<-EOH
  rsync -atv ./ /srv/www/wordpress/current/wp-content/themes/top100/
  EOH
end
