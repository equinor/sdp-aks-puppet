class compliance::services {

  service { 'xinetd':
    ensure => 'stopped',
    enable => false
  }
  service { 'avahi-daemon':
    ensure => 'stopped',
    enable => false
  }
  service { 'cups':
    ensure => 'stopped',
    enable => false
  }
  service { 'isc-dhcp-server':
    ensure => 'stopped',
    enable => false
  }
  service { 'isc-dhcp-server6':
    ensure => 'stopped',
    enable => false
  }
  service { 'slapd':
    ensure => 'stopped',
    enable => false
  }
  service { 'nfs-server':
    ensure => 'stopped',
    enable => false
  }
  service { 'rpcbind':
    ensure => 'stopped',
    enable => false
  }
  service { 'bind9':
    ensure => 'stopped',
    enable => false
  }
  service { 'vsftpd':
    ensure => 'stopped',
    enable => false
  }
  service { 'apache2':
    ensure => 'stopped',
    enable => false
  }
  service { 'dovecot':
    ensure => 'stopped',
    enable => false
  }
  service { 'smbd':
    ensure => 'stopped',
    enable => false
  }
  service { 'squid':
    ensure => 'stopped',
    enable => false
  }
  service { 'snmpd':
    ensure => 'stopped',
    enable => false
  }
  service { 'rsyncd':
    ensure => 'stopped',
    enable => false
  }
  service { 'nis':
    ensure => 'stopped',
    enable => false
  }
}
