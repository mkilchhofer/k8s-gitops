# Install traefik into k3s
```
kubectl apply -f traefik.yaml
```
This deploys a helmchart into k3s (API: helm.cattle.io/v1 , Kind: HelmChart). The integrated k3s helm-controller will deploy it in a `helm install xy`-way
