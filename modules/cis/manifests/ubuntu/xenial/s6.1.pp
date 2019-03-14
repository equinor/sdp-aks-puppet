# Ubuntu CIS 16.04 Section #6.1
class cis::ubuntu::xenial::s6.1 {

  # 6.1.2
  file { '/etc/passwd':
    ensure => file,
    owner  => 'root',
    group  => 'root',
    mode   => '0644',
  }
  # 6.1.3
  file { '/etc/shadow':
    ensure => file,
    owner  => 'root',
    group  => 'shadow',
    mode   => '0640',
  }
  # 6.1.4
  file { '/etc/group':
    ensure => file,
    owner  => 'root',
    group  => 'root',
    mode   => '0644',
  }
  # 6.1.5
  file { '/etc/gshadow':
    ensure => file,
    owner  => 'root',
    group  => 'shadow',
    mode   => '0640',
  }
  # 6.1.6
  file { '/etc/passwd-':
    ensure => file,
    owner  => 'root',
    group  => 'root',
    mode   => '0644',
  }
  # 6.1.7
  file { '/etc/shadow-':
    ensure => file,
    owner  => 'root',
    group  => 'shadow',
    mode   => '0640',
  }
  # 6.1.8
  file { '/etc/group-':
    ensure => file,
    owner  => 'root',
    group  => 'root',
    mode   => '0644',
  }
  # 6.1.9
  file { '/etc/gshadow-':
    ensure => file,
    owner  => 'root',
    group  => 'shadow',
    mode   => '0640',
  }
}
