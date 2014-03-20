remote_file "aws_config" do
  path "/usr/share/php/AWSSDKforPHP/config.inc.php"
  source "file:///var/www/wso/data/config.inc.php"
  owner "root"
  group "root"
  mode 0755
end
