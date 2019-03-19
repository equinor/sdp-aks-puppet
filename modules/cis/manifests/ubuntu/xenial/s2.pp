# Ubuntu CIS 16.04 Section #2
class cis::ubuntu::xenial::s2 {

  # 2.1.10, 2.2.4-14, 2.2.16-17
  $services = [
    'xinetd',
    'avahi-daemon',
    'cups',
    'isc-dhcp-server',
    'isc-dhcp-server6',
    'slapd',
    'nfs-server',
    'rpcbind',
    'bind9',
    'vsftpd',
    'apache2',
    'dovecot',
    'smbd',
    'squid',
    'snmpd',
    'rsyncd',
    'nis',
  ]
  service { $services:
    ensure => 'stopped',
    enable => false
  }

  # 2.1.11, 2.2.2, 2.3.1-5
  $packages = [
    'openbsd-inetd',
    'xserver-xorg',
    'nis',
    'rsh-redone-client',
    'rsh-client',
    'talk',
    'telnet',
    'ldap-utils',
  ]
  package { $packages:
    ensure => 'purged',
  }

  # 2.2.1.1 and 2.2.1.2
  class { 'ntp':
    servers  => [ 'ntp.ubuntu.com' ],
    restrict => [
      '-4 default kod nomodify notrap nopeer noquery',
      '-6 default kod nomodify notrap nopeer noquery'
    ]
  }

  # 2.2.15 - Not used, so make sure not installed
  package { 'postfix':
    ensure => 'purged'
  }
}
