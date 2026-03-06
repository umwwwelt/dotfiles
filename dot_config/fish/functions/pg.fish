function pg
    set -l config_file "./source/config.local.json"
    
    # Vérifier que le fichier existe
    if not test -f $config_file
        echo "Erreur: $config_file non trouvé dans "(pwd) >&2
        return 1
    end
   
    # Extraire les credentials du secret Kubernetes
    set -l secret (kubectl get secret -o json pg-troubadour 2>/dev/null | jq '.data | map_values(@base64d)')
    
    if test $status -ne 0; or test -z "$secret"
        echo "Erreur: impossible de récupérer le secret pg-troubadour" >&2
        return 1
    end
    
    set -l username (echo $secret | jq -r '.RF_PG_USERNAME')
    set -l password (echo $secret | jq -r '.RF_PG_PASSWORD')
   
    # Créer un backup
    cp $config_file $config_file.backup
    
    # Mettre à jour le fichier
    jq --arg user "$username" --arg pass "$password" \
       '.db.user = $user | .db.password = $pass' \
       $config_file > tmp.json
    
    if test $status -ne 0
        echo "Erreur: échec de la mise à jour JSON" >&2
        mv $config_file.backup $config_file
        return 1
    end
    
    mv tmp.json $config_file
    rm -f $config_file.backup
    
    echo "✅ Credentials PostgreSQL mis à jour dans $config_file"
end
