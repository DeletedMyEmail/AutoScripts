#!/bin/bash
# $1 = path to repo
# $2 = port

PROCESSOUTPUT=$(ss -tulpin | grep :4242)
PID=${PROCESSOUTPUT#*pid=}
PID=${PID%,*}

kill "$PID"
echo "Killed process with id $PID"
cd $1
git pull
cd out/artifacts/KMesReworkServer/
java -jar *.jar $2 &
disown -h

echo "KMes Server updated and restarted"
