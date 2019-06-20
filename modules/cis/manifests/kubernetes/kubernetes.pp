# Kubernetes CIS benchmark v1.3.0
class cis::kubernetes 
{
  $files = [ 's2']
  $files.each |$file| { include "cis::kubernetes::${file}" }
}
