#! /bin/bash

if [ -z $1 ]
then
  echo "Executable name required."
  echo "usage: makemake.sh executable_name"
fi
echo "$1 :" *.cpp > Makefile 
echo -e "\tg++ -ansi -Wall -g -o" $* *.cpp >> Makefile
echo >> Makefile
TEMP=$1
shift 
sed -i "s/\.cpp/\.o/g" Makefile
for i in *.cpp; do
  echo -n "$i : $i " | sed "s/\.cpp/\.o/" >> Makefile
  echo "$(grep '".*.h"' $i)" | sed "s/.*\"\(.*.h\).*/\1/g" | tr "\n" " " >> Makefile
  echo >> Makefile
  echo -e "\tg++ -ansi -Wall -g -c" $* $i >> Makefile
  echo >> Makefile
done
echo 'clean :' >> Makefile
echo -e "\trm -f $TEMP" *.cpp | sed "s/\.cpp/\.o /g" >> Makefile

