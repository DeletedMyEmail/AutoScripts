#!/bin/bash

USERNAME=$1
REPONAME=$2
TOKEN=$3
SCRIPTPATH="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"

python $SCRIPTPATH/create_repo.py $REPONAME $TOKEN

cd "$PWD"

mkdir -p $REPONAME
cd $REPONAME	
git init
touch README.md	
git add .
git commit -m "init"
git branch -m master main
git remote add origin https://github.com/$USERNAME/$REPONAME.git	
git push -u origin main


