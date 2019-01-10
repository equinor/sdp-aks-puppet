class compliance::touch_reboot {
  ## TOUCH REBOOT SENTINEL ##
  exec { 'touch-reboot':
    command => 'touch /var/run/reboot-required',
    path => '/bin:/usr/bin',
    refreshonly => true
  }
}
