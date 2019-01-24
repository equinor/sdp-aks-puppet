class compliance::docker_icc {
  ## DISABLE DOCKER ICC ##
  augeas { 'disable icc':
    incl    => '/etc/systemd/system/docker.service.d/exec_start.conf',
    lens    => 'Systemd.lns',
    context => '/files/etc/systemd/system/docker.service.d/exec_start.conf/Service',
    changes => "set ExecStart[ command = '/usr/bin/dockerd' ]/arguments/01 '--icc=false'",
    onlyif  => "match ExecStart[ command = '/usr/bin/dockerd' ]/arguments/*[ . = '--icc=false' ] size == 0"
  } ~> Exec['touch-reboot']
}
