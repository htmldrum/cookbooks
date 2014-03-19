execute "install php-pear"  do
	command "sudo apt-get -y install php-pear"
	action :run

execute "update pear channel" do
	command "sudo pear channel-update pear.php.net"
	action :run

execute "run pear global upgrade" do
	command "sudo pear upgrade-all"
	action :run

execute "discover phpunit pear channel" do
	command "sudo pear channel-discover pear.phpunit.de"
	action :run

execute "Final install of phpunit pear repo" do
	command "sudo pear install -a phpunit/PHPUnit"
	action :run
