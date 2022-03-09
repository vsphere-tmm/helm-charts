# vSphere TMM Helm Charts

Unofficial repository of helm charts created by the vSphere Technical Marketing team.

## Adding this helm repository

To add the helm repository for the vSphere CSI driver, run the following commands:

```bash
helm repo add vsphere-tmm https://vsphere-tmm.github.io/helm-charts
helm search repo vsphere-csi
```

`values.yaml` files for the charts can be found in the `charts/[chartname]` directories.

## Releasing

```sh
# Add and update helm repos
helm repo add common https://charts.bitnami.com/bitnami
helm repo add vsphere-tmm https://vsphere-tmm.github.io/helm-charts
helm repo update

# Package CPI Chart
cd charts/vsphere-cpi
helm dependency update
cd ..
helm package vsphere-cpi

# Package CSI Chart
cd charts/vsphere-csi
helm dependency update
cd ..
helm package vsphere-csi

# Update repo index
cd ..
helm repo index --url https://vsphere-tmm.github.io/helm-charts/charts/ charts
mv charts/index.yaml .

# Push to master and gh-pages
git add .
git commit -m "...."
git push
git checkout gh-pages
git merge master
git push
```

## TODO

* ~~Automate chart release process~~
