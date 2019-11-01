# My K3s Kubernetes platform

## Master

```bash
[root@k3s-master ~]# INSTALL_K3S_EXEC="--no-deploy=traefik,servicelb,local-storage" /home/mkilchhofer/k3s/install.sh |tee -a /home/mkilchhofer/k3s/install_20191101.log
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
