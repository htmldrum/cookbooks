template "/var/www/wineapi/application/config/cloudsearch.php" do
  source "cloudsearch.php.erb"
  owner "root"
  group "root"
  mode "644"
end

execute "cloud search json WGET" do
  command "wget --output-document=/tmp/csfile --no-check-certificate https://wineapi.mshanken.com/discover/cloudsearch/domain/production`date +%Y%m%d`"
  action :run
end

execute "cloudsearch index create" do
  command "php /var/www/wineapi/modules/metamodel/tools/cloudsearch/start-domain.php ./tmp/csfile"
  action :run
end
