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

# Put here your favorite editor
qtcreator CMakeLists.txt

# Test the code with make
mkdir $BUILD
cmake . -B$BUILD
make -C $BUILD

if [ $? -ne 0 ]; then
echo "Nonworking code. Finish"

else #[ $? -ne 0 ]
echo "Working code. Pushing to git"
rm -r $BUILD
git submodule foreach git commit -a
# If working code, you will be prompted for commits. It will need a terminal to accept changes.
git commit -a
git push --recurse-submodules=on-demand

fi #[ $? -ne 0 ]