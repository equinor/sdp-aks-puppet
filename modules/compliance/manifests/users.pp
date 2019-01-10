class compliance::users {
  ## CLEAN UNNECESSARY USERS ##
  user { 'bin':
    ensure => 'absent'
  }
  user { 'sync':
    ensure => 'absent'
  }
  user { 'games':
    ensure => 'absent'
  }
  user { 'lp':
    ensure => 'absent'
  }
  user { 'news':
    ensure => 'absent'
  }
  user { 'uucp':
    ensure => 'absent'
  }
  user { 'proxy':
    ensure => 'absent'
  }
  user { 'backup':
    ensure => 'absent'
  }
  user { 'list':
    ensure => 'absent'
  }
  user { 'irc':
    ensure => 'absent'
  }
}
