class compliance::modules {
  ## BLACKLIST KERNEL MODULES ##
  $module_blacklist = @(EOT)
    # File managed by Puppet
    # Modules disabled per Azure baseline
    install dccp /bin/true
    install sctp /bin/true
    install rds /bin/true
    install tipc /bin/true
    install cramfs /bin/true
    install freevxfs /bin/true
    install hfs /bin/true
    install hfsplus /bin/true
    install jffs2 /bin/true
    install squashfs /bin/true
    | EOT
  file { '/etc/modprobe.d/blacklist-azurebaseline.conf':
    ensure => file,
    content => $module_blacklist,
    owner => 'root',
    group => 'root',
    mode => '0644'
  } ~> Exec['touch-reboot']
}
