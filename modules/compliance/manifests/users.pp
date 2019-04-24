class compliance::users {
  ## CLEAN UNNECESSARY USERS ##
  $users = [
    'bin',
    'sync',
    'games',
    'lp',
    'news',
    'uucp',
    'proxy',
    'backup',
    'list',
    'irc',
  ]
  user { $users:
    ensure => 'absent'
  }
}
