# nginxx Helm Chart

> Deploie un nginx simple avec Service et Ingress.

## Sommaire
- 🧩 Presentation
- ✅ Prerequis
- 🚀 Installation rapide
- 🧪 Rendu local (template)
- 🔧 Configuration (values)
- 🏷️ Tags / Labels
- 🧹 Desinstallation

## 🧩 Presentation
Ce chart installe :
- un `Deployment` nginx
- un `Service` (par defaut `ClusterIP`)
- un `Ingress` (optionnel)

## ✅ Prerequis
- Kubernetes accessible (`kubectl` configure)
- Helm installe
- Un Ingress Controller si l'Ingress est active (ex: Traefik)

## 🚀 Installation rapide
```bash
helm upgrade --install nginxx charts/nginxx -n nginxx --create-namespace
```

## 🧪 Rendu local (template)
```bash
helm template nginxx charts/nginxx -n nginxx
```

## 🔧 Configuration (values)
Les valeurs se trouvent dans `values.yaml` et peuvent etre surchargees.
Exemple :
```bash
helm upgrade --install nginxx charts/nginxx \
  -n nginxx --create-namespace \
  --set image.tag=1.25-alpine \
  --set ingress.enabled=true \
  --set ingress.host=nginxx.exemple.local
```

### Parametres principaux
- `replicaCount`: nombre de pods
- `image.repository`: image docker
- `image.tag`: tag image
- `service.type`: type de service (ClusterIP/NodePort/LoadBalancer)
- `ingress.enabled`: active ou non l'Ingress
- `ingress.className`: classe d'Ingress
- `ingress.host`: nom DNS
- `resources`: requests/limits

## 🏷️ Tags / Labels
Le chart applique des labels Kubernetes standard :
- `app.kubernetes.io/name`
- `app.kubernetes.io/instance`
- `app.kubernetes.io/version`
- `app.kubernetes.io/managed-by`
- `helm.sh/chart`

## 🧹 Desinstallation
```bash
helm uninstall nginxx -n nginxx
```
