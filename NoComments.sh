#!/bin/bash
n=0
for cfile in *.c
do
  sed -i '/^\/\*/,/^\*\/$/ d' $cfile
done
