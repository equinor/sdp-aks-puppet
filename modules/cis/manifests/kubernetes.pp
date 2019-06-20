# Include all Kubernetes CIS rules
class cis::kubernetes {
  if $facts['os']['name'] == 'Ubuntu' {
    case $facts['os']['release']['full'] {
      '16.04': { include cis::kubernetes::aks }
      default: { notify("Unsupported version of Ubuntu ${facts['os']['release']['full']}") }
    }
  }
}
