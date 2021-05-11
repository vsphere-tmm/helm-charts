{{/*
Return the proper controller image name
*/}}
{{- define "vsphere-csi.controller.controller.image" -}}
{{ include "common.images.image" (dict "imageRoot" .Values.controller.controller.image "global" .Values.global) }}
{{- end -}}
{{/*
Return the proper controller resizer image name
*/}}
{{- define "vsphere-csi.controller.resizer.image" -}}
{{ include "common.images.image" (dict "imageRoot" .Values.controller.resizer.image "global" .Values.global) }}
{{- end -}}
{{/*
Return the proper controller attacher image name
*/}}
{{- define "vsphere-csi.controller.attacher.image" -}}
{{ include "common.images.image" (dict "imageRoot" .Values.controller.attacher.image "global" .Values.global) }}
{{- end -}}
{{/*
Return the proper controller liveness-probe image name
*/}}
{{- define "vsphere-csi.controller.liveness-probe.image" -}}
{{ include "common.images.image" (dict "imageRoot" .Values.controller.liveness-probe.image "global" .Values.global) }}
{{- end -}}
{{/*
Return the proper controller syncer image name
*/}}
{{- define "vsphere-csi.controller.syncer.image" -}}
{{ include "common.images.image" (dict "imageRoot" .Values.controller.syncer.image "global" .Values.global) }}
{{- end -}}
{{/*
Return the proper controller provisioner image name
*/}}
{{- define "vsphere-csi.controller.provisioner.image" -}}
{{ include "common.images.image" (dict "imageRoot" .Values.controller.provisioner.image "global" .Values.global) }}
{{- end -}}



{{/*
Return the proper node registrar image name
*/}}
{{- define "vsphere-csi.node.registrar.image" -}}
{{ include "common.images.image" (dict "imageRoot" .Values.node.registrar.image "global" .Values.global) }}
{{- end -}}
{{/*
Return the proper node image name
*/}}
{{- define "vsphere-csi.node.node.image" -}}
{{ include "common.images.image" (dict "imageRoot" .Values.node.node.image "global" .Values.global) }}
{{- end -}}
{{/*
Return the proper node liveness-probe image name
*/}}
{{- define "vsphere-csi.node.liveness-probe.image" -}}
{{ include "common.images.image" (dict "imageRoot" .Values.node.liveness-probe.image "global" .Values.global) }}
{{- end -}}


{{/*
Return the proper image name (for the init container volume-permissions image)
*/}}
{{- define "vsphere-csi.volumePermissions.image" -}}
{{- include "common.images.image" ( dict "imageRoot" .Values.volumePermissions.image "global" .Values.global ) -}}
{{- end -}}

{{/*
Return the proper Docker Image Registry Secret Names
*/}}
{{- define "vsphere-csi.imagePullSecrets" -}}
{{- include "common.images.pullSecrets" (dict "images" (list .Values.controller.image .Values.node.image .Values.volumePermissions.image) "global" .Values.global) -}}
{{- end -}}

{{/*
Create the name of the service account to use
*/}}
{{- define "vsphere-csi.controller.serviceAccountName" -}}
{{- if .Values.serviceAccount.create -}}
    {{ default (printf "%s-controller" (include "common.names.fullname" .)) .Values.controller.serviceAccount.name }}
{{- else -}}
    {{ default "default" .Values.controller.serviceAccount.name }}
{{- end -}}
{{- end -}}

{{/*
Create the name of the service account to use
*/}}
{{- define "vsphere-csi.node.serviceAccountName" -}}
{{- if .Values.serviceAccount.create -}}
    {{ default (printf "%s-node" (include "common.names.fullname" .)) .Values.node.serviceAccount.name }}
{{- else -}}
    {{ default "default" .Values.node.serviceAccount.name }}
{{- end -}}
{{- end -}}

{{/*
Compile all warnings into a single message.
*/}}
{{- define "vsphere-csi.validateValues" -}}
{{- $messages := list -}}
{{- $messages := append $messages (include "vsphere-csi.validateValues.foo" .) -}}
{{- $messages := append $messages (include "vsphere-csi.validateValues.bar" .) -}}
{{- $messages := without $messages "" -}}
{{- $message := join "\n" $messages -}}

{{- if $message -}}
{{-   printf "\nVALUES VALIDATION:\n%s" $message -}}
{{- end -}}
{{- end -}}

