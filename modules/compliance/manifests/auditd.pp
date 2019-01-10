class compliance::auditd {
  include auditd

  ## AUDIT DOCKER ##
  auditd::rule { 'watch /usr/bin/docker':
    content => '-w /usr/bin/docker -p wa',
    order   => 101
  }
  auditd::rule { 'watch /var/lib/docker':
    content => '-w /var/lib/docker -p wa',
    order   => 102
  }
  auditd::rule { 'watch /etc/docker':
    content => '-w /etc/docker -p wa',
    order   => 103
  }
  auditd::rule { 'watch /lib/systemd/system/docker.service':
    content => '-w /lib/systemd/system/docker.service -p wa',
    order   => 104
  }
  auditd::rule { 'watch /lib/systemd/system/docker.socket':
    content => '-w /lib/systemd/system/docker.socket -p wa',
    order   => 105
  }
  auditd::rule { 'watch /etc/default/docker':
    content => '-w /etc/default/docker -p wa',
    order   => 106
  }
  auditd::rule { 'watch /etc/docker/daemon.json':
    content => '-w /etc/docker/daemon.json -p wa',
    order   => 107
  }
  auditd::rule { 'watch /usr/bin/docker-containerd':
    content => '-w /usr/bin/docker-containerd -p wa',
    order   => 108
  }
  auditd::rule { 'watch /usr/bin/docker-runc':
    content => '-w /usr/bin/docker-runc -p wa',
    order   => 109
  }
}
