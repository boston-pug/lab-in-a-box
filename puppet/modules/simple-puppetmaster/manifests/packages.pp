class simple_puppetmaster::packages {
  package { 'httpd': ensure => present }
  package { 'mod_ssl': ensure => present }
  package { 'mod_passenger': ensure => present }
  package { 'puppet-server': ensure => present }
}
