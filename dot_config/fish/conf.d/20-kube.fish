abbr -a k kubectl
abbr -a kg "kubectl get"
abbr -a kd "kubectl describe"
abbr -a kgp "kubectl get pods"
abbr -a kgns "kubectl get namespaces"
abbr -a kgall "kubectl get ingress,service,deployment,pod,statefulset"
abbr -a kuc "kubectl config use-context"
abbr -a kns "kubectl config set-context (kubectl config current-context) --namespace"
abbr -a kgc "kubectl config get-contexts"
abbr -a kex "kubectl exec -it"
abbr -a kl "kubectl logs"

function kdecode
  kubectl get secret -o json $argv | jq '.data | map_values(@base64d)'
end
