# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vm.provider :virtualbox do |vb|
    vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
    vb.customize ["modifyvm", :id, "--natdnsproxy1", "on"]
    vb.customize ["modifyvm", :id, "--memory", 4098]
  end
  
  #-----------------Box

  config.vm.box = "CentOS 6.5 x86_64"
  config.vm.box_url = "https://github.com/2creatives/vagrant-centos/releases/download/v6.5.1/centos65-x86_64-20131205.box"

  #-----------------Provisions
  # RPM Forge
  config.vm.provision :shell, :path => "provision/rpmforge.sh", :args => "2.4.9"

  config.vm.provision :shell, :inline => "yum -y install wget tmux vim ctags sqlite-devel freetype fontconfig ImageMagick-devel redis"

  # Git
  config.vm.provision :shell, :path => "provision/git.sh"

  # Ruby
  config.vm.provision :shell, :path => "provision/rvm.sh", :args => "stable"
  config.vm.provision :shell, :path => "provision/ruby.sh", :args => "2.1.2 bundler"

  # Node
  config.vm.provision :shell, :path => "provision/nvm.sh"
  config.vm.provision :shell, :path => "provision/nodejs.sh", :args => "0.10.25"

  # Mongo
  config.vm.provision :shell, :path => "provision/mongo.sh", :args => "2.4.9"

  # PhantomJs
  config.vm.provision :shell, :path => "provision/phantomjs.sh"

  # AWS CLI
  config.vm.provision :shell, :path => "provision/aws-cli.sh"

  # Prepare first time
  config.vm.provision :shell, :path => "provision/prepare_first_time.sh"

  #-----------------Network

  # Rails
  config.vm.network :forwarded_port, guest: 3000, host: 3000

  # Sinatra
  config.vm.network :forwarded_port, guest: 6000, host: 6000

  # MongoDB
  config.vm.network :forwarded_port, guest: 27017, host: 27017

  # Redis
  config.vm.network :forwarded_port, guest: 6379, host: 6379
  config.vm.network :forwarded_port, guest: 6380, host: 6380

  # Node
  config.vm.network :forwarded_port, guest: 8080, host: 8080
end
  

  
  


  
