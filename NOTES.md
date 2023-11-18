Get argocd password:
 kubectl get secret -n argocd argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d

Port forward:
  k port-forward svc/argocd-server -n argocd 8081:80
