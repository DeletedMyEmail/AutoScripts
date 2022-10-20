#!/bin/bash
# $1 = path to repo
# $2 = port

PROCESSOUTPUT=$(ss -tulpin | grep :4242)
PID=${PROCESSOUTPUT#*pid=}
PID=${PID%,*}

kill $PID
cd $1
git pull https://github.com/KaitoKunTatsu/KMesRework.git
cd out/artifacts/KMesReworkServer/
java -jar *.jar $2 &
disown -h

echo "KMes updated and restarted"
