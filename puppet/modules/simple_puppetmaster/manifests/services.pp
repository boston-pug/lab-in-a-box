class simple_puppetmaster::services {
  service { 'httpd':
    ensure  => running,
    enable  => false,
    require => Package['httpd'],
  }
  service { 'puppetmaster':
    ensure  => stopped,
    enable  => false,
    require => Package['puppet-server'],
  }
}
