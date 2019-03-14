class compliance::packages {
  # TODO: Cosider NTP/Chrony (2.2.1,)
  package { 'openbsd-inetd':
    ensure => 'purged',
  }
  package { 'xserver-xorg':
    ensure => 'purged',
  }
  package { 'nis':
    ensure => 'purged',
  }
  package { 'rsh-redone-client':
    ensure => 'purged',
  }
  package { 'rsh-client':
    ensure => 'purged',
  }
  package { 'talk':
    ensure => 'purged',
  }
  package { 'telnet':
    ensure => 'purged',
  }
  package { 'ldap-utils':
    ensure => 'purged',
  }
}
