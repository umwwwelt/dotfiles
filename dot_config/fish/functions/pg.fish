# Remplit le bloc db de ./source/config.local.json depuis un secret Kubernetes.
# Le tunnel SSH vers la base doit tourner à côté (voir le README du projet).
#
#   pg t                        -> troubadour (pré-prod)
#   pg g                        -> grimoire   (pré-prod)
#   pg <secret> [args kubectl]  -> n'importe quel secret, contexte explicite
function pg --argument-names target
    set -l config_file "./source/config.local.json"
    set -l kube_args $argv[2..]
    set -l secret_name $target

    switch "$target"
        case '' t troubadour
            set secret_name pg-troubadour
        case g grimoire
            set secret_name pg-grimoire-pg15
    end

    # Par défaut la pré-prod : c'est le seul environnement auquel on se connecte depuis le poste.
    test -z "$kube_args"; and set kube_args --context priv1 -n ppmurmure

    if not test -f $config_file
        echo "Erreur: $config_file non trouvé dans "(pwd) >&2
        return 1
    end

    set -l secret (kubectl $kube_args get secret -o json $secret_name 2>/dev/null | jq '.data | map_values(@base64d)')

    if test $status -ne 0; or test -z "$secret"
        echo "Erreur: secret $secret_name introuvable ("$kube_args")" >&2
        return 1
    end

    # host reste localhost : on passe par le tunnel SSH, pas par l'adresse du cluster.
    set -l updated (echo $secret | jq --slurpfile config $config_file '
        . as $s
        | $config[0]
        | .db.user     = $s.RF_PG_USERNAME
        | .db.password = $s.RF_PG_PASSWORD
        | .db.database = $s.RF_PG_DATABASE
        | .db.port     = ($s.RF_PG_WRITER_PORT | tonumber)
        | .db.host     = "localhost"' 2>/dev/null)

    if test $status -ne 0; or test -z "$updated"
        echo "Erreur: échec de la mise à jour de $config_file" >&2
        return 1
    end

    echo $updated | jq . > $config_file
    echo "✅ $secret_name → $config_file (port "(echo $secret | jq -r .RF_PG_WRITER_PORT)")"
end
