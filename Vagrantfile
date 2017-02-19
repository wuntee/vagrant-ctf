# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/xenial32"
  config.vm.provision :shell, :path => "vagrant_setup.sh", :privileged => false
  config.ssh.username = 'ubuntu'
  config.ssh.forward_agent = true

  config.vm.synced_folder "vagrant_share", "/home/ubuntu/vagrant_share"

  config.vm.provider "virtualbox" do |vb|
    vb.customize ["modifyvm", :id, "--memory", "2048"]
  end
end
