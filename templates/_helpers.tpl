# Helper template: base name used by resources.
# Allows user overrides via `nameOverride`.
{{- define "nginxx.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

# Helper template: full name used by resources.
# Allows user overrides via `fullnameOverride`.
{{- define "nginxx.fullname" -}}
{{- if .Values.fullnameOverride -}}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- printf "%s" $name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}

# Helper template: standard Kubernetes labels for consistent tagging.
# These labels are reused across Deployment, Service, and Ingress.
{{- define "nginxx.labels" -}}
app.kubernetes.io/name: {{ include "nginxx.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/version: {{ .Chart.AppVersion }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
helm.sh/chart: {{ .Chart.Name }}-{{ .Chart.Version }}
{{- end -}}
