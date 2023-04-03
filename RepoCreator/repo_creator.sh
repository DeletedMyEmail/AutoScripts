#!/bin/bash

USERNAME=$1
REPONAME=$2
TOKEN=$3
VISIBILITY=$4

SCRIPTPATH="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"

sudo apt install python3
sudo apt install python3-pip
python3 -m pip install --upgrade pip 
pip install PyGithub
python3 $SCRIPTPATH/repo_creator.py $REPONAME $TOKEN $VISIBILITY

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


