
execute "run phing install" do

command "sudo pear channel-discover pear.phing.info && sudo pear install phing/phing"

action :run

end
