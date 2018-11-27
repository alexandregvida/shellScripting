#!/bin/bash 

if [ -z $1 ]
then 
	while [ -z $requisicao ]
	do
		read -p "Voce esqueceu de passar o parametro(GET, PUT, POST, DELETE): " requisicao
		letra_maiuscula=$(echo $requisicao | awk '{ print toupper($1) }')
	done 
else
	letra_maiuscula=$(echo $1 | awk '{ print toupper($1) }')
fi

echo $letra_maiuscula

case $letra_maiuscula in
	GET)
	cat apache.log | grep GET
	;;
	POST)
	cat apache.log | grep POST
	;;
	PUT)
	cat apache.log | grep PUT
	;;
	DELETE)
	cat apache.log | grep DELETE
	;;
	*)
	echo "O parametro passado não e valido"
	;;
esac

