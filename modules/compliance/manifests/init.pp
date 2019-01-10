class compliance {
  include compliance::touch_reboot
  include compliance::auditd
  include compliance::modules
  include compliance::users
  include compliance::docker_icc
  include compliance::night_sentinel
}
