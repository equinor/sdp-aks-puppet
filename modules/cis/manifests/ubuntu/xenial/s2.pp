# Ubuntu CIS 16.04 Section #2
class cis::ubuntu::xenial::s2 {

  # 2.1.10
  service { 'xinetd':
    ensure => 'stopped',
    enable => false
  }

  # 2.2.1.1 and 2.2.1.2
  class { 'ntp':
    servers  => [ 'ntp.ubuntu.com' ],
    restrict => [
      '-4 default kod nomodify notrap nopeer noquery',
      '-6 default kod nomodify notrap nopeer noquery'
    ]
  }

  # 2.2.3
  service { 'avahi-daemon':
    ensure => 'stopped',
    enable => false
  }
  # 2.2.4
  service { 'cups':
    ensure => 'stopped',
    enable => false
  }
  # 2.2.5
  service { 'isc-dhcp-server':
    ensure => 'stopped',
    enable => false
  }
  # 2.2.5
  service { 'isc-dhcp-server6':
    ensure => 'stopped',
    enable => false
  }
  # 2.2.6
  service { 'slapd':
    ensure => 'stopped',
    enable => false
  }
  # 2.2.7
  service { 'nfs-server':
    ensure => 'stopped',
    enable => false
  }
  # 2.2.7
  service { 'rpcbind':
    ensure => 'stopped',
    enable => false
  }
  # 2.2.8
  service { 'bind9':
    ensure => 'stopped',
    enable => false
  }
  # 2.2.9
  service { 'vsftpd':
    ensure => 'stopped',
    enable => false
  }
  # 2.2.10
  service { 'apache2':
    ensure => 'stopped',
    enable => false
  }
  # 2.2.11
  service { 'dovecot':
    ensure => 'stopped',
    enable => false
  }
  # 2.2.12
  service { 'smbd':
    ensure => 'stopped',
    enable => false
  }
  # 2.2.13
  service { 'squid':
    ensure => 'stopped',
    enable => false
  }
  # 2.2.14
  service { 'snmpd':
    ensure => 'stopped',
    enable => false
  }
  # 2.2.16
  service { 'rsyncd':
    ensure => 'stopped',
    enable => false
  }
  # 2.2.17
  service { 'nis':
    ensure => 'stopped',
    enable => false
  }
  # 2.1.11
  package { 'openbsd-inetd':
    ensure => 'purged',
  }
  # 2.2.2
  package { 'xserver-xorg':
    ensure => 'purged',
  }
  # 2.3.1
  package { 'nis':
    ensure => 'purged',
  }
  # 2.3.2
  package { 'rsh-redone-client':
    ensure => 'purged',
  }
  # 2.3.2
  package { 'rsh-client':
    ensure => 'purged',
  }
  # 2.3.3
  package { 'talk':
    ensure => 'purged',
  }
  # 2.3.4
  package { 'telnet':
    ensure => 'purged',
  }
  # 2.3.5
  package { 'ldap-utils':
    ensure => 'purged',
  }
}
