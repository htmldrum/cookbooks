#Setting db values

template "/var/www/identity/application/config/database.php" do
  source "database.php.erb"
  owner "root"
  group "root"
  mode "644"
end

#Setting identity values

template "/var/www/identity/application/config/identity.php" do
  source "identity.php.erb"
  owner "root"
  group "root"
  mode "644"
end

#Setting metamodel values

template "/var/www/identity/application/config/metamodel.php" do
  source "metamodel.php.erb"
  owner "root"
  group "root"
  mode "644"
end

#Setting metamodeluser values

template "/var/www/identity/application/config/metamodeluser.php" do
  source "metamodeluser.php.erb"
  owner "root"
  group "root"
  mode "644"
end

#Setting test values

template "/var/www/identity/application/config/test.php" do
  source "test.php.erb"
  owner "root"
  group "root"
  mode "644"
end
