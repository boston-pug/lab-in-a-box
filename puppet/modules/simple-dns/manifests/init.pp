class simple_dns::client {
  file { '/etc/resolv.conf':
    source => "puppet:///modules/simple-dns/resolv.conf",
    group => 'root',
  }
}

# CentOS specific and incredibly braindead DNS module
class simple_dns::server {
  package { 'bind': ensure => present } ->

  file { '/etc/named.conf':
    source => "puppet:///modules/simple-dns/named.conf",
    mode => "0640",
    group => "named",
    notify => Service['named'],
  }
  file { '/etc/named/db.203.0.113':
    source => "puppet:///modules/simple-dns/db.203.0.113",
    mode => "0640",
    group => "named",
    require => Package['bind'],
    notify => Service['named'],
  }
  file { '/etc/named/db.example':
    source => "puppet:///modules/simple-dns/db.example",
    mode => "0640",
    group => "named",
    require => Package['bind'],
    notify => Service['named'],
  }

  service { 'named':
    ensure => running,
    enable => false,
  }
}
