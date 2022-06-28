#!/bin/sh
n=-1
c=0
if [ -n "$3" ]
then
   n=$3
fi

to_stdout() {
   WAIT=$(shuf -i $1-$2 -n 1)
   sleep $(echo "scale=4; $WAIT/1000" | bc)
   I=$(shuf -i 1-4 -n 1)
   D=`date -Iseconds`
   case "$I" in
      "1") echo "$D ERROR com.example.service1 main U1 Something went wrong"
      ;;
      "2") echo "$D INFO com.example.service2 worker1 U2 Task completed successfully"
      ;;
      "3") echo "$D WARN com.example.service1 main U3 Please upgrade to latest version"
      ;;
      "4") echo "$D DEBUG com.example.service3 worker2 U1 check /tmp/app.log for debug logs"
      ;;
   esac
}

# logs generated inside files
while [ $n -ne $c ]
do
   sleep 1
   to_stdout $1 $2
   c=$(( c+1 ))
done