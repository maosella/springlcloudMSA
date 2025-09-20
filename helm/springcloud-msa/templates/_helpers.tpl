{{- define "springcloud-msa.labels" -}}
app.kubernetes.io/name: {{ include "springcloud-msa.name" . }}
helm.sh/chart: {{ include "springcloud-msa.chart" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{- define "springcloud-msa.selectorLabels" -}}
app.kubernetes.io/name: {{ include "springcloud-msa.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{- define "springcloud-msa.chart" -}}
{{ .Chart.Name }}-{{ .Chart.Version | replace "+" "_" }}
{{- end }}

{{- define "springcloud-msa.name" -}}
{{ .Chart.Name }}
{{- end }}

{{- define "springcloud-msa.standardLabels" -}}
app.kubernetes.io/managed-by: {{ .Release.Service }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
