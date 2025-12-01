#!/bin/sh
a=1 # to control loop
times=1 #to count # executions

# remove previous outputFails.txt
if [ -e outputFails.txt ]
then
    rm outputFails.txt
fi

while [ $a -ne 0 ]
do
   echo $times
   # execute script and append output files and overwrite error file
   # with values redirected from STDOUT and STDERR
   sh ./failsRarely.sh 2> errorFails.txt 1>> outputFails.txt
   
   # stop loop if error code not 0 
   if [[ $? -ne 0 ]]; then
      a=0
   else
      # increment value of times
      times=$((times+1))
   fi
done

cat outputFails.txt errorFails.txt
echo "Failed after $times times"
