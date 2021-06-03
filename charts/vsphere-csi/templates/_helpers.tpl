{{/*
Return the proper csi image name
*/}}
{{- define "vSphereCSI.image" -}}
{{ include "common.images.image" (dict "imageRoot" .Values.vSphereCSI.image "global" .Values.global) }}
{{- end -}}

{{/*
Return the proper csi image name
*/}}
{{- define "vSphereCSI.attacherImage" -}}
{{ include "common.images.image" (dict "imageRoot" .Values.vSphereCSI.attacherImage "global" .Values.global) }}
{{- end -}}

{{/*
Return the proper csi image name
*/}}
{{- define "vSphereCSI.resizerImage" -}}
{{ include "common.images.image" (dict "imageRoot" .Values.vSphereCSI.resizerImage "global" .Values.global) }}
{{- end -}}

{{/*
Return the proper csi image name
*/}}
{{- define "vSphereCSI.livenessProbeImage" -}}
{{ include "common.images.image" (dict "imageRoot" .Values.vSphereCSI.livenessProbeImage "global" .Values.global) }}
{{- end -}}

{{/*
Return the proper csi image name
*/}}
{{- define "vSphereCSI.syncerImage" -}}
{{ include "common.images.image" (dict "imageRoot" .Values.vSphereCSI.syncerImage "global" .Values.global) }}
{{- end -}}

{{/*
Return the proper csi image name
*/}}
{{- define "vSphereCSI.provisionerImage" -}}
{{ include "common.images.image" (dict "imageRoot" .Values.vSphereCSI.provisionerImage "global" .Values.global) }}
{{- end -}}

{{/*
Return the proper csi image name
*/}}
{{- define "vSphereCSI.node.image" -}}
{{ include "common.images.image" (dict "imageRoot" .Values.vSphereCSINode.image "global" .Values.global) }}
{{- end -}}

{{/*
Return the proper csi image name
*/}}
{{- define "vSphereCSI.node.driverRegistrarImage" -}}
{{ include "common.images.image" (dict "imageRoot" .Values.vSphereCSINode.driverRegistrarImage "global" .Values.global) }}
{{- end -}}

{{/*
Return the proper Docker Image Registry Secret Names
*/}}
{{- define "vSphereCSI.imagePullSecrets" -}}
{{- include "common.images.pullSecrets" (dict "images" (list .Values.vSphereCSI.image  ) "global" .Values.global) -}}
{{- end -}}

{{/*
Create the name of the controller service account to use
*/}}
{{- define "vSphereCSI.controllerServiceAccountName" -}}
{{- if .Values.serviceAccount.create -}}
    {{ default (printf "controller-%s" (include "common.names.fullname" .)) .Values.serviceAccount.controllerName }}
{{- else -}}
    {{ default "default" .Values.serviceAccount.controllerName }}
{{- end -}}
{{- end -}}

{{/*
Create the name of the node service account to use
*/}}
{{- define "vSphereCSI.nodeServiceAccountName" -}}
{{- if .Values.serviceAccount.create -}}
    {{ default (printf "node-%s" (include "common.names.fullname" .)) .Values.serviceAccount.nodeName }}
{{- else -}}
    {{ default "default" .Values.serviceAccount.nodeName }}
{{- end -}}
{{- end -}}

{{/*
Compile all warnings into a single message.
*/}}
{{- define "vSphereCSI.validateValues" -}}
{{- $messages := list -}}
{{- $messages := without $messages "" -}}
{{- $message := join "\n" $messages -}}
{{- if $message -}}
{{-   printf "\nVALUES VALIDATION:\n%s" $message -}}
{{- end -}}
{{- end -}}
