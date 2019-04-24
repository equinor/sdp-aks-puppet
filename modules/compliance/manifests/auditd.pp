class compliance::auditd {

  auditd::rule { 'docker audit rules':
    content => '-w /usr/bin/docker -p wa -k docker',
# -w /var/lib/docker -p wa -k docker
# -w /etc/docker -p wa -k docker
# -w /lib/systemd/system/docker.service -p wa -k docker
# -w /lib/systemd/system/docker.socket -p wa -k docker
# -w /etc/default/docker -p wa -k docker
# -w /etc/docker/daemon.json -p wa -k docker
# -w /usr/bin/docker-containerd -p wa -k docker
# -w /usr/bin/docker-runc -p wa -k docker',
    order   => 101
  }
}
