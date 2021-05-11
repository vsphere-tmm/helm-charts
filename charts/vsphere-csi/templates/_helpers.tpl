{{/*
Return the proper controller image name
*/}}
{{- define "vsphere-csi.controller.image.controller" -}}
{{ include "common.images.image" (dict "imageRoot" .Values.controller.image.controller "global" .Values.global) }}
{{- end -}}
{{/*
Return the proper controller resizer image name
*/}}
{{- define "vsphere-csi.controller.image.resizer" -}}
{{ include "common.images.image" (dict "imageRoot" .Values.controller.image.resizer "global" .Values.global) }}
{{- end -}}
{{/*
Return the proper controller attacher image name
*/}}
{{- define "vsphere-csi.controller.image.attacher" -}}
{{ include "common.images.image" (dict "imageRoot" .Values.controller.image.attacher "global" .Values.global) }}
{{- end -}}
{{/*
Return the proper controller livenessProbe image name
*/}}
{{- define "vsphere-csi.controlle.image.livenessProbe" -}}
{{ include "common.images.image" (dict "imageRoot" .Values.controller.image.livenessProbe "global" .Values.global) }}
{{- end -}}
{{/*
Return the proper controller syncer image name
*/}}
{{- define "vsphere-csi.controller.image.syncer" -}}
{{ include "common.images.image" (dict "imageRoot" .Values.controller.image.syncer "global" .Values.global) }}
{{- end -}}
{{/*
Return the proper controller provisioner image name
*/}}
{{- define "vsphere-csi.controller.image.provisioner" -}}
{{ include "common.images.image" (dict "imageRoot" .Values.controlle.image.provisioner "global" .Values.global) }}
{{- end -}}



{{/*
Return the proper node registrar image name
*/}}
{{- define "vsphere-csi.node.image.registrar" -}}
{{ include "common.images.image" (dict "imageRoot" .Values.node.image.registrar "global" .Values.global) }}
{{- end -}}
{{/*
Return the proper node image name
*/}}
{{- define "vsphere-csi.node.image.node" -}}
{{ include "common.images.image" (dict "imageRoot" .Values.node.image.node "global" .Values.global) }}
{{- end -}}
{{/*
Return the proper node livenessProbe image name
*/}}
{{- define "vsphere-csi.node.image.livenessProbe" -}}
{{ include "common.images.image" (dict "imageRoot" .Values.node.image.livenessProbe "global" .Values.global) }}
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
{{- if .Values.controller.serviceAccount.create -}}
    {{ default (printf "%s-controller" (include "common.names.fullname" .)) .Values.controller.serviceAccount.name }}
{{- else -}}
    {{ default "default" .Values.controller.serviceAccount.name }}
{{- end -}}
{{- end -}}

{{/*
Create the name of the service account to use
*/}}
{{- define "vsphere-csi.node.serviceAccountName" -}}
{{- if .Values.node.serviceAccount.create -}}
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

