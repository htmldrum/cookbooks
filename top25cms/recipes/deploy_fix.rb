# Grab the code for the theme from github.
git "/tmp/caoTop25" do
  repository "git@github.com:mshanken/caoTop25.git"
  revision "reverting_11-25"
  action :sync
  user "root"
  group "root"
end


# Rsync that theme over to the install dir.

script "run rsync" do
  interpreter "bash"
  user "root"
  cwd "/tmp/caoTop25/"
  code <<-EOH
  rsync -atv ./ /srv/www/wordpress/current/wp-content/themes/caoTop25/
  EOH
end
