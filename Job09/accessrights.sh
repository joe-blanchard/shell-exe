#!/bin/bash

# Emplacement du fichier CSV (dans le même dossier que le script)
csv_file="Shell_Userlist.csv"

# Parcours du fichier CSV
while IFS=',' read -r username role; do

    if [ "$role" = "admin" ]; then
        # Créer l'utilisateur avec des privilèges de superutilisateur
        sudo useradd -m -G sudo "$username"
        echo "Utilisateur $username créé avec des privilèges de superutilisateur."

    else
        # Créer un utilisateur normal
        sudo useradd -m "$username"
        echo "Utilisateur $username créé."
    fi
    
done <"$csv_file"
