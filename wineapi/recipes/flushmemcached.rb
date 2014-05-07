#This recipe cleans the memcached layer for WineAPI.Production


execute do "Flush memcached"

	command "echo 'flush_all' | netcat ec2-54-83-201-12.compute-1.amazonaws.com 11211"

	action :run

end
