#!/bin/bash

# Emplacement du fichier CSV (dans le même dossier que le script)
csv_file="Shell_Userlist.csv"

# Fonction pour créer les utilisateurs
creer_utilisateurs() {
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
  done < "$csv_file"
}

# Créer les utilisateurs à partir du fichier CSV
creer_utilisateurs

# Supprimer les utilisateurs créés à partir du fichier CSV
supprimer_utilisateurs() {
  while IFS=',' read -r username role; do
    # Supprimer l'utilisateur
    sudo userdel -r "$username"  # Supprime l'utilisateur et son répertoire personnel
    echo "Utilisateur $username supprimé."
  done < "$csv_file"
}

# Pour supprimer les utilisateurs, utilisez la commande suivante :
# ./accessrights.sh supprimer
if [ "$1" = "supprimer" ]; then
  supprimer_utilisateurs
fi
