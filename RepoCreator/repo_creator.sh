#!/bin/bash

USERNAME=$1
TOKEN=$2
REPONAME=$3
VISIBILITY=$4

SCRIPTPATH="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"

python -m pip install --upgrade pip 
pip install PyGithub
python $SCRIPTPATH/repo_creator.py $REPONAME $TOKEN $VISIBILITY

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


