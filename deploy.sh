#!/bin/bash


########################################################
#
# Description : lancement d'une plateforme de conteneurs
#
# Auteur : Thierno Mouaz BAH
#
# Date : 25/11/2025
#
########################################################

#si option --create
if [ "$1" == "--create" ];then

    USERNAME=$(whoami)
    nb_machine=1
    [ "$2" != "" ] && nb_machine=$2

  # récupération de idmax
	idmax=`docker ps -a --format '{{ .Names}}' | awk -F "-" -v user="$USER" '$0 ~ user"-alpine" {print $3}' | sort -r |head -1`


    echo "Creation du/des conteneur(s)"
    for i in $(seq 1 $nb_machine);do
        docker run -tid --name $USERNAME-alpine-$i alpine:latest
        echo "Conteneur $USERNAME-alpine-$i créé"
    done
    
    # echo "J'ai créé ${nb_machine} containeur(s)"


# si option --drop
elif [ "$1" == "--drop" ];then

    
	echo "Suppression du/des conteneur(s)"
    docker rm -f $(docker ps | grep $USERNAME-alpine | awk '{print $1}') 
    echo "Conteneur(s) supprimé(s)"

# si option --start
elif [ "$1" == "--start" ];then
  
    echo ""
	echo " notre option est --start"
	echo ""

# si option --ansible
elif [ "$1" == "--ansible" ];then
  
    echo ""
	echo " notre option est --ansible"
	echo ""

# si option --infos
elif [ "$1" == "--infos" ];then
  
    echo ""
	echo " notre option est --infos"
	echo ""

# si aucune option affichage de l'aide
else

echo "

Options :
		- --create : lancer des conteneurs

		- --drop : supprimer les conteneurs créer par le deploy.sh
	
		- --infos : caractéristiques des conteneurs (ip, nom, user...)

		- --start : redémarrage des conteneurs

		- --ansible : déploiement arborescence ansible

"

fi
