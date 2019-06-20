# Kubernetes CIS benchmark v1.3.0
class cis::kubernetes::aks{
  $files = [ 's2']
  $files.each |$file| { include "cis::kubernetes::aks::${file}" }
}
