# My K3s Kubernetes platform

## Master

```bash
[root@k3s-master k3s-install]# INSTALL_K3S_EXEC="--no-deploy=traefik,servicelb,local-storage" ./install.sh |tee -a install_2019<date>.log
```

## Nodes

Get current k3os config

```bash
sudo cat /k3os/system/config.yaml
sudo cat /var/lib/rancher/k3os/hostname
```

Post install tasks (workaround search domain issue)

```bash
sudo connmanctl services
sudo connmanctl services ethernet_bee0536a9e0a_cable
sudo connmanctl config ethernet_bee0536a9e0a_cable --ipv4 manual 192.168.92.34 255.255.255.0 192.168.92.1 --nameservers 192.168.92.1
sudo connmanctl config ethernet_42ce90d0d76d_cable --ipv6 off
sudo connmanctl config ethernet_42ce90d0d76d_cable --domains localdomain
sudo service connman restart
```

## Helm Operator Installation (by Flux CD)

Run these commands with helm v3

Add the fluxcd repo:

```sh
helm3 repo add fluxcd https://charts.fluxcd.io
```

Install the HelmRelease CRD:

```sh
kubectl apply -f https://raw.githubusercontent.com/fluxcd/helm-operator/1.2.0/deploy/crds.yaml
```

Install Helm Operator for Helm v3 only:

```sh
kubectl create ns flux

helm3 upgrade -i helm-operator fluxcd/helm-operator \
--version 1.2.0 \
--namespace flux \
--set helm.versions=v3
```

Source: https://github.com/fluxcd/helm-operator/blob/master/chart/helm-operator/README.md
