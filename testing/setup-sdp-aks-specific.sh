# To setup the vagrant test cluster;
# 1. cd to the dir with the Vagrantfile
# 2. vagrant up
# 3. vagrant ssh k8s-head
# 4. bash /vagrant/setup-sdp-aks-specific.sh

# Kubectl completion
echo 'source <(kubectl completion bash)' >> ~/.bashrc

# Install helm
wget https://storage.googleapis.com/kubernetes-helm/helm-v2.13.0-rc.2-linux-amd64.tar.gz
tar -zxvf helm-v2.13.0-rc.2-linux-amd64.tar.gz
sudo mv linux-amd64/helm /usr/bin/helm
sudo chmod +x /usr/bin/helm
# Install kubens
wget https://raw.githubusercontent.com/ahmetb/kubectx/master/kubens
sudo mv kubens /usr/bin/
sudo chmod +x /usr/bin/kubens

# Init helm
mkdir /home/vagrant/git
mkdir /home/vagrant/git/manifests
wget -O /home/vagrant/git/manifests/tiller-service-account.yml https://raw.githubusercontent.com/equinor/sdp-aks/master/manifests/tiller-service-account.yml
wget -O /home/vagrant/git/manifests/infrastructure-namespaces.yml https://raw.githubusercontent.com/equinor/sdp-aks/master/manifests/infrastructure-namespaces.yml
kubectl apply -f /home/vagrant/git/manifests
helm init --service-account tiller
# Give it some time
sleep 15

# Init flux w/ no gitrepo
helm repo add weaveworks https://weaveworks.github.io/flux

helm install --name flux --set rbac.create=true --set helmOperator.create=true --namespace infrastructure weaveworks/flux

# Taint master
kubectl taint nodes --all node-role.kubernetes.io/master-

# Apply aks-puppet-helmrelease
cat << EOF > /home/vagrant/git/manifests/aks-node-puppet.yaml
---
apiVersion: flux.weave.works/v1beta1
kind: HelmRelease
metadata:
  name: aks-node-puppet
  namespace: infrastructure
  annotations:
    flux.weave.works/automated: "true"
spec:
  releaseName: aks-node-puppet
  chart:
    git: http://github.com/equinor/sdp-aks-node-puppet.git
    ref: master
    path: helm/aks-node-puppet
  values:
    env:
      GIT_REPO: http://github.com/equinor/sdp-aks-puppet.git
      GIT_BRANCH: develop
EOF

kubectl apply -f /home/vagrant/git//manifests/aks-node-puppet.yaml
