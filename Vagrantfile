# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"
 
# Deprecated in 1.5
# Vagrant.require_plugin "vagrant-vbguest"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  # Don't share the default synced folder
  config.vm.synced_folder "", "/vagrant", disabled: true

  # Replace with your puppet folder
  # config.vm.synced_folder "~/Workspace/puppet", "/puppet"

  # Common puppet manifests and modules (default.pp)
  config.vm.provision :puppet do |puppet|
    puppet.module_path    = "./puppet/modules"
    puppet.manifests_path = "./puppet/manifests"
  end

  config.vm.define "puppet" do |puppetmaster|
    puppetmaster.vm.box = "pug/centos-puppetmaster"
    
    puppetmaster.vm.hostname = "puppet.example.com"
    puppetmaster.vm.network "private_network", 
      ip: "203.0.113.2",
      virtualbox__intnet: "example"

    puppetmaster.vm.synced_folder "puppet/ssl/puppet", 
      "/var/lib/puppet/ssl", 
      owner: "puppet", 
      group: "puppet"

    puppetmaster.vm.provision :puppet do |puppet|
      puppet.manifest_file  = "puppetmaster.pp"
      puppet.module_path    = "./puppet/modules"
      puppet.manifests_path = "./puppet/manifests"
    end
  end

  config.vm.define "centos6" do |centos|
    centos.vm.box = "pug/centos-6.5"

    centos.vm.hostname = "centos6.example.com"
    centos.vm.network "private_network", 
      ip: "203.0.113.3", 
      virtualbox__intnet: "example"

    centos.vm.synced_folder "./puppet/ssl/centos6", 
      "/var/lib/puppet/ssl", 
      owner: "puppet", 
      group: "puppet"
  end

  config.vm.define "centos7" do |centos|
    centos.vm.box = "pug/centos-7.0"

    centos.vm.hostname = "centos7.example.com"
    centos.vm.network "private_network",
      ip: "203.0.113.4",
      virtualbox__intnet: "example"

    centos.vm.synced_folder "./puppet/ssl/centos7",
      "/var/lib/puppet/ssl",
      owner: "puppet",
      group: "puppet"
  end
 
  config.vm.define "precise" do |ubuntu|
    ubuntu.vm.box = "pug/ubuntu-precise"

    ubuntu.vm.hostname = "precise.example.com"
    ubuntu.vm.network "private_network", 
      ip: "203.0.113.5", 
      virtualbox__intnet: "example"

    ubuntu.vm.synced_folder "./puppet/ssl/precise", 
      "/var/lib/puppet/ssl", 
      owner: "puppet", 
      group: "puppet"
  end

  config.vm.define "trusty" do |ubuntu|
    ubuntu.vm.box = "pug/ubuntu-trusty"

    ubuntu.vm.hostname = "trusty.example.com"
    ubuntu.vm.network "private_network",
      ip: "203.0.113.6",
      virtualbox__intnet: "example"

    ubuntu.vm.synced_folder "./puppet/ssl/trusty",
      "/var/lib/puppet/ssl",
      owner: "puppet",
      group: "puppet"
  end

  config.vm.define "scientific" do |centos|
    centos.vm.box = "pug/scientific"

    centos.vm.hostname = "scientific.example.com"
    centos.vm.network "private_network",
      ip: "203.0.113.6",
      virtualbox__intnet: "example"

    centos.vm.synced_folder "./puppet/ssl/scientific",
      "/var/lib/puppet/ssl",
      owner: "puppet",
      group: "puppet"
  end
end
