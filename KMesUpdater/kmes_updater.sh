#!/bin/bash
# $1 = path to repo
# $2 = port

PROCESSTOKILL= sudo lsof -t -i:"$2"
if [ ! -z "$PROCESSTOKILL" ]
then
	kill -15 "$PROCESSTOKILL"
	echo "Process killed"
else 
	echo "$PROCESSTOKILL"
	echo "KMes not running"
fi

cd $1
git pull
cd out/artifacts/KMesReworkServer/
java -jar *.jar $2 &
disown -h

echo "KMes Server updated and restarted"
