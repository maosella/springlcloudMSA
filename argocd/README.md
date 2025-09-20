# Argo CD application manifest

The `applications/springcloud-msa.yaml` manifest defines an Argo CD `Application` that deploys the Helm chart in this repository.

Apply it in a cluster where Argo CD is installed:

```bash
kubectl apply -f argocd/applications/springcloud-msa.yaml
```

The manifest instructs Argo CD to:

- Track this Git repository (`path: helm/springcloud-msa`).
- Deploy the chart into the `springcloud-msa` namespace.
- Automatically create the namespace and keep the deployment in sync (self-heal + prune).

Update the `repoURL` or `targetRevision` fields if you push the chart to a fork or tag.
