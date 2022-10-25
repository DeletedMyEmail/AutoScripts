#!/bin/bash
# $1 = path to repo
# $2 = port

PROCESSTOKILL=$(sudo lsof -t -i:$2)
if [[ -n "$PROCESSTOKILL" ]]
then
	kill -15 "$PROCESSTOKILL"
	echo "Process killed $PROCESSTOKILL"
else 
	echo "KMes not running"
fi

cd $1
git pull
cd out/artifacts/KMesReworkServer/
java -jar *.jar $2 &
disown -h

echo "KMes Server updated and restarted"
