Docker Boxes
-------------

Preparation and testing of Chef scripts for production using Docker.
Based on [http://tech.paulcz.net/2013/09/creating-immutable-servers-with-chef-and-docker-dot-io.html](http://tech.paulcz.net/2013/09/creating-immutable-servers-with-chef-and-docker-dot-io.html)

## Usage

1. Copy Dockerfile, Berksfile, solo.json, solo.rb to new directory
2. Update run lists, recipes and cookbook locations for your application
3. Submit pull request
3. Either take Docker image and build it or export the runlist to opsworks

## Please update this list from [Vagrantbox.es](http://www.vagrantbox.es/)

- Opsworks Ubuntu 12.04 64b: http://opscode-vm-bento.s3.amazonaws.com/vagrant/virtualbox/opscode_ubuntu-12.04_chef-provisionerless.box
- Ubuntu 12.04 64b: https://cloud-images.ubuntu.com/vagrant/precise/current/precise-server-cloudimg-amd64-vagrant-disk1.box
