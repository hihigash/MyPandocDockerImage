#!/bin/sh

DIRECTORY="out"
if [ ! -e $DIRECTORY ]; then
  mkdir $DIRECTORY
fi

find `pwd` -name "*.md" | while read LINE
do
  echo "Convert $LINE ..."
  FILENAME=`basename $LINE .md`
  pandoc $LINE -o ./out/$FILENAME.pptx
done
echo "Done!"
