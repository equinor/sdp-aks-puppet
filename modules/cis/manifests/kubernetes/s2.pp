# Kubernetes CIS benchmark v1.3.0 section 2
class cis::kubernetes::s2 {

  # 2.2.9 and 2.2.10
  file { '/var/lib/kubelet/kubeconfig':
    owner => 'root',
    group => 'root',
    mode  => '0644'
  }
}
