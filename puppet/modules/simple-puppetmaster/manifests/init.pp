class simple_puppetmaster::packages {
  package { 'httpd': ensure => present }
  package { 'mod_ssl': ensure => present }
  package { 'mod_passenger': ensure => present }
  package { 'puppet-server': ensure => present }
}

class simple_puppetmaster::services {
  service { 'httpd': 
    ensure => running, 
    enable => false, 
    require => Package['httpd'], 
  }
  service { 'puppetmaster': 
    ensure => stopped, 
    enable => false, 
    require => Package['puppet-server'],
  }
}

class simple_puppetmaster {
  require simple_puppetmaster::packages
  include simple_puppetmaster::services

  # Fix up the reports directory
  file { '/var/lib/puppet/reports/':
    ensure => directory,
    owner => 'puppet',
  }

  # Set up rack directories and puppetmaster in passenger
  file { '/usr/share/puppet/rack': 
    ensure => directory, 
    owner => "puppet", 
  } ->
  file { '/usr/share/puppet/rack/puppetmaster': 
    ensure => directory, 
    owner => "puppet", 
  } ->
  file { '/usr/share/puppet/rack/puppetmaster/public': 
    ensure => directory, 
    owner => "puppet", 
    group => "puppet", 
  } ->
  file { '/usr/share/puppet/rack/puppetmaster/config.ru': 
    source => 'puppet:///modules/simple-puppetmaster/config.ru', 
    owner => "puppet", 
    require => File['/usr/share/puppet/rack/puppetmaster'], 
    notify => Service['httpd'], 
  }

  # Apache config
  file { '/etc/httpd/conf.d/puppetmaster.conf':
    source => 'puppet:///modules/simple-puppetmaster/puppetmaster.conf',
    notify => Service['httpd'],
  }
}
