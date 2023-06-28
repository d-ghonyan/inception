#!/bin/bash

echo $1 $2 ;

if [[ $1 == "" ]]
then
	echo "not enough arguments" ; 
	exit ;
fi

if [[ $2 == "" ]]
then
	echo "not enough arguments" ; 
	exit ;
fi

docker $1 `docker ps | grep $2 | awk '{print $1}'` $3
