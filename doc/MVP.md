# AsciiArtify MVP deployment

MVP Argo CD application
```yaml
apiVersion: argoproj.io/v1alpha1
kind: Application
metadata:
  name: img2ascii
spec:
  destination:
    name: ''
    namespace: default
    server: 'https://kubernetes.default.svc'
  source:
    path: helm
    repoURL: 'https://github.com/den-vasyliev/go-demo-app'
    targetRevision: HEAD
  sources: []
  project: default
  syncPolicy:
    automated:
      prune: false
      selfHeal: false
    syncOptions:
      - CreateNamespace=true
```

Presentation
![MPV DEMO](mpv.gif)

### Trobleshuting
If you have a random error with the "Ambassador app" on laptop apple silicon, connect the power cable, after it I didn't have a problem.
