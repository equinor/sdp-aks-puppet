# Ubuntu CIS 16.04 Section #1
class cis::ubuntu::xenial::s1 {
  # 1.8
  package { 'unattended-upgrades':
    ensure => 'present'
  }
  file { '/etc/apt/apt.conf.d/50unattended-upgrades':
    ensure => 'file',
    mode   => '0644',
    owner  => 'root',
    group  => 'root',
    source => 'puppet:///modules/cis/ubuntu/xenial/s1.8-50unattended-upgrades'
  }
  file { '/etc/apt/apt.conf.d/20auto-upgrades':
    ensure => 'file',
    mode   => '0644',
    owner  => 'root',
    group  => 'root',
    source => 'puppet:///modules/cis/ubuntu/xenial/s1.8-20auto-upgrades'
  }
}
