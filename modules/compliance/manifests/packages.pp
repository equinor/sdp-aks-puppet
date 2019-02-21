class compliance::packages {
  # TODO: Cosider NTP/Chrony (2.2.1,)
  package { 'openbsd-inetd':
    ensure => 'purged',
  }
  package { 'xserver-xorg':
    ensure => 'purged',
  }
  package { '':
    ensure => 'purged',
  }
  package { '':
    ensure => 'purged',
  }
  package { '':
    ensure => 'purged',
  }
  package { '':
    ensure => 'purged',
  }
  package { '':
    ensure => 'purged',
  }
  package { '':
    ensure => 'purged',
  }
}
