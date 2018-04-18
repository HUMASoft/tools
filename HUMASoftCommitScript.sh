#!/bin/bash
#Remember to change the name of this file according to repo name!!!!!

CODE=`basename "$0"`
CODE="${CODE%.*}"
REPO=https://github.com/HUMASoft/"$CODE".git #for another organizations change the fixed repo part.
BUILD=../.build-"$CODE"

echo $CODE
echo $REPO

git submodule foreach git commit -a
# If working code, you will be prompted for commits. It will need a terminal to accept changes.
git commit -a
git push --recurse-submodules=on-demand
