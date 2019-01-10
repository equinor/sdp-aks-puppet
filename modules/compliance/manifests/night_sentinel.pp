class compliance::night_sentinel {
  ## KURED REBOOT AT NIGHT ##
  cron { 'kured-night-reboot':
    ensure => present,
    command => '[ -f "/var/run/reboot-required" ] && touch /var/run/reboot-required-night',
    user => 'root',
    minute => '0',
    hour => '1'
  }
  cron { 'kured-night-sentinel-remove':
    ensure => present,
    command => '[ ! -f "/var/run/reboot-required" ] && [ -f "/var/run/reboot-required-night" ] && rm -rf /var/run/reboot-required-night',
    user => 'root',
    minute => '37'
  }
}
