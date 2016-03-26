#! /bin/bash

for file in *
do
  if [[ $file = *.c ]]; then
    if [[ `grep -e '^printf' -e '^fprintf' $file` ]]
    then  
      if ! [[ `grep '#include <stdio.h>' $file` ]]
      then
       sed -i '1 i\#include <stdio.h>' $file
      fi
    fi
  fi
done

