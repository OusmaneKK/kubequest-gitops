# How to build Kubernetes Dashboard

## Apply Manifests

```bash
kubectl apply -k path/to/manifest/folder/
```

## Create Token in order to Access dashboard

```bash
kubectl -n kubernetes-dashboard create token admin-user
```

## Cert manager install

```bash
kubectl apply -f https://github.com/cert-manager/cert-manager/releases/download/v1.8.0/cert-manager.crds.yaml
helm repo add jetstack https://charts.jetstack.io
helm repo update
helm install cert-manager jetstack/cert-manager --namespace cert-manager --create-namespace --version v1.8.0
```
