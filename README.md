# Azure AKS puppet for compliance

Small repository used for making sure the Azure AKS nodes is compliant.

## Workflow and best practices

1. Create a new feature branch based on `master`
2. Test the feature branch on a _local test cluster_
3. Merge the feature branch into the `develop` branch
4. The dev cluster on Azure runs the `develop` puppet branch. If there is no issues there, create pull request to master.

## Testing and Development

In the `testing` directory there is a Vagrantfile and a shell script.  
By running these you get;
* A 2 worker, 1 master K8s cluster
* Nodes running Ubuntu 16.04
* Calico CNI
* Helm + Tiller
* Flux w/Helm Operator
* The aks-node-puppet daemonset subscribed to the `develop` branch of http://github.com/equinor/sdp-aks-puppet.git

### Pre-requisites

 * **[Vagrant 2.1.4+](https://www.vagrantup.com)**
 * **[Virtualbox 5.2.18+](https://www.virtualbox.org)**
 * Dont be behind corp-proxy

### To setup the Vagrant test cluster;

```bash
 cd  testing
 vagrant up
 ...
 vagrant ssh k8s-head
 # Run this a the "vagrant"-user
 bash /vagrant/setup-sdp-aks-specific.sh
```
