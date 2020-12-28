{*
 Copyright 2019 Google LLC

 Licensed under the Apache License, Version 2.0 (the "License");
 you may not use this file except in compliance with the License.
 You may obtain a copy of the License at

     http://www.apache.org/licenses/LICENSE-2.0

 Unless required by applicable law or agreed to in writing, software
 distributed under the License is distributed on an "AS IS" BASIS,
 WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 See the License for the specific language governing permissions and
 limitations under the License.
*}

{{/* vim: set filetype=mustache: */}}
{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "openmatchscale.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{- define "openmatchscale.scaleBackend.hostName" -}}
{{- .Values.scaleBackend.hostName | default (printf "%s-backend" (include "openmatchscale.fullname" . ) ) -}}
{{- end -}}

{{- define "openmatchscale.scaleFrontend.hostName" -}}
{{- .Values.scaleFrontend.hostName | default (printf "%s-frontend" (include "openmatchscale.fullname" . ) ) -}}
{{- end -}}

{{- define "openmatchscale.scaleMmf.hostName" -}}
{{- .Values.scaleMmf.hostName | default (printf "%s-mmf" (include "openmatchscale.fullname" . ) ) -}}
{{- end -}}

{{- define "openmatchscale.scaleEvaluator.hostName" -}}
{{- .Values.scaleEvaluator.hostName | default (printf "%s-evaluator" (include "openmatchscale.fullname" . ) ) -}}
{{- end -}}