#!/bin/sh
mkdir out

find `pwd` -name "*.md" | while read line
do
  echo $line
  filename=`basename $line .md`
  pandoc $filename.md -o ./out/$filename.pptx 
done
