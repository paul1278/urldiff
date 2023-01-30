#!/bin/bash

while read page; do
  PAGE=`echo $page | cut -d "|" -f "1"`
  REPL=`echo $page | cut -d "|" -f "2"`
  CONTENT=`curl -s $PAGE | sed "s|$REPL||g"`
  PAGE_ID=`echo $PAGE | md5sum | cut -c 1-32`
  echo "$CONTENT" > $PAGE_ID.new
  NEW_SUM=`cat $PAGE_ID.new | md5sum | cut -c 1-32`
  OLD_SUM=`cat $PAGE_ID | md5sum | cut -c 1-32`
  if ! [ "$NEW_SUM" = "$OLD_SUM" ]; then
    echo "Content differs!"
    DIFF=`diff $PAGE_ID.new $PAGE_ID`
    ./action.sh $PAGE "$DIFF"
  fi
  mv $PAGE_ID.new $PAGE_ID

done<pages
