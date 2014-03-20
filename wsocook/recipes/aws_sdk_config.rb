bash "aws_config" do
  user "root"
  group "root"
  code <<-EOH
  cp /var/www/wso/data/config.inc.php /usr/share/php/AWSSDKforPHP/config.inc.php
  chmod 755 /usr/share/php/AWSSDKforPHP/config.inc.php
  EOH
end
