#!/bin/bash

if [ $# -eq 0 ];then
	NAME=`finger | tail -n +2 | head -1 | cut -d " " -f 1`
elif [ $# -gt 1 ];then
	echo "Za dużo argumentów"
elif [ $# -eq 1 ];then
	if [ $1 == "-v" ];then
		echo "Wersja programu 1.0"
		echo "Data modyfikacji: `stat $0 | cut -d \"\\"\" -f 4`"
	else
		NAME=$1
	fi
fi



if [ $# -eq 0 ] || [ $1 != "-v" ];then
	ZADANIE=0
	SCIEZKA=`pwd`
	NAZWAPLIKU=wynikPoszukiwan.txt
	clear
		while [ $ZADANIE -ne 6 ];do

			TASK1=`ls $SCIEZKA | wc -l`
			TASK2=`ls -R $SCIEZKA | grep -v './' | grep ".+*" | wc -l`

			echo "1. Nazwa użytkownika: $NAME"
			echo "2. Ścieżka: $SCIEZKA"
			echo "3. Liczba plików i folderów w ścieżce: $TASK1"
			echo "4. Liczba plików i folderów w ścieżce i jej zagłębieniach: $TASK2"
			echo "5. Zapisz do pliku $NAZWAPLIKU"
			echo "6. Wyjdź z programu"

			read ZADANIE

			if [ $ZADANIE -eq 1 ];then
				clear
				echo "Podaj nową nazwę użytkownika: "		
				read NAME
				clear
			elif [ $ZADANIE -eq 2 ];then
				clear
				echo "Podaj nową ścieżkę"
				read SCIEZKA
				clear
			elif [ $ZADANIE -eq 5 ];then
				clear
				touch $NAZWAPLIKU
				echo "zad 1: " > $NAZWAPLIKU
				echo "$TASK1" >> $NAZWAPLIKU
				echo "zad 2: " >> $NAZWAPLIKU
				echo "$TASK2" >> $NAZWAPLIKU
			
				echo "Wyniki zapisano do pliku o nazwie: $NAZWAPLIKU"
			fi
		done
	clear
fi
