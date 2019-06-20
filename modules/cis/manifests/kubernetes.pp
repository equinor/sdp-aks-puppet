# Include all Kubernetes CIS rules
class cis::kubernetes {
      { include cis::kubernetes::aks }
}
