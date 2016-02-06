#! /bin/bash

if [ $# -eq 0 ]
  then
  for i in *.txt; do
  echo "Displaying first 3 lines of ${i}:"
  head -n 3 $i
  echo
  echo -n "Delete file ${i}? (y/n) "
  read RESPONSE
  if [ $RESPONSE == 'y' ]
    then
    rm $i
  fi
  done
else
  for i in $*; do
  echo "Displaying first 3 lines of ${i}:"
  head -n 3 $i
  echo 
  echo -n "Delete file ${i}? (y/n) "
  read RESPONSE
  if [ $RESPONSE == 'y' ]
    then
    rm $i
  fi
  done
fi  
