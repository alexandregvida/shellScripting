#!/bin/bash

memoria_total=$(free | grep -i mem | awk '{ print $2}')
memoria_consumida=$(free | grep -i mem | awk '{ print $3}')
relacao_memoria_atual_toral=$(bc <<< "scale=2;$memoria_consumida/$memoria_total *100" | awk -F. '{print $1 }')

if [ $relacao_memoria_atual_toral -gt 20 ]
then 
	mail -s "Consumo de memoria acima do limite" alexandre.config@gmail.com<<del
	O consumo de memoria esta acima do limite que foi especificado. Atualmete o consumo e de $(free -h | grep -i mem | awk '{ print $3 }')
del
fi



echo $relacao_memoria_atual_toral