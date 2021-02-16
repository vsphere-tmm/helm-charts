# vSphere TMM Helm Charts

Unofficial repository of helm charts create by the vSphere Technical Marketing team.

## Adding this helm repository

To add the helm repository for the vSphere CSI driver, run the following commands:

```bash
helm repo add vsphere-tmm https://vsphere-tmm.github.io/helm-charts
helm search repo vsphere-csi
```

`values.yaml` files for the charts can be found in the `charts/[chartname]` directories.
