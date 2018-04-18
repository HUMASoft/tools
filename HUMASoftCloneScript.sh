#!/bin/bash
#Remember to change the name of this file according to repo name!!!!!

CODE=`basename "$0"`
CODE="${CODE%.*}"
REPO=https://github.com/HUMASoft/"$CODE".git #for another organizations change the fixed repo part.
BUILD=../.build-"$CODE"

echo $CODE
echo $REPO

if [ -d $CODE ]; then
echo "existing workdir. Updating"
cd $CODE
pwd
git pull
git submodule foreach git pull

else #[ -d $CODE ]
echo "no local workdir"
git clone --recursive "$REPO"
cd $CODE
git submodule foreach git checkout master

fi #[ -d $CODE ]
