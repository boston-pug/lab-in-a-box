lab-in-a-box
============

A minimalist multi-machine puppet lab in vagrant. Meant to be a starting point
for your own labs.  The puppetmaster is currently Centos6.5 as this is the 
lowest common denominator in most modern puppet set ups.

##Instructions
- Download and install Vagrant - http://www.vagrantup.com/downloads.html
- Download and install VirtualBox - https://www.virtualbox.org/wiki/Downloads
- Download or clone this repo
- Navigate to where you downloaded or cloned this repo
- Open the Vagrantfile and:
  - set up any shared folders (for individual testing of modules).
  - uncomment the appropriate boxes you wish to work with.
- vagrant up or vagrant up --provider=virtualbox

##Currently provides
- An isolated private network (TEST-NET-3 documentation address space)
- DNS not reliant on vagrant plugins
- A Puppet Master running via mod_passenger
- Ubuntu 12.04 and 14.04 LTS machines
- Centos 6.5 and Centos 7.0 machines
- A Scientific Linux 6.5 machine

##Validating puppet
vagrant ssh ${machine} -c "sudo puppet agent -t"

##More Info

DNS is managed with bind via puppet/modules/simple_dns/files/db.example.com and reverse dns is managed via puppet/modules/simple_dns/files/db.203.0.113

By default the puppetmaster forwards DNS requests through the host over the nat connection.

For lots of detail on setting up a complete sandbox see:
- http://devops.huit.harvard.edu/vagrant-tutorial/
- http://www.cammorato.com/2014/03/setting-up-your-ide/
- http://www.cammorato.com/2014/03/setting-up-your-sandbox/
- http://www.cammorato.com/2014/05/dissecting-the-vagrantfile/

For the packer templates used for the machines see: https://github.com/boston-pug/packer-templates
