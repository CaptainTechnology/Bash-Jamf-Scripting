

#!/bin/bash

for i in {1..10}
do 
    echo "$i"
    if [ $i -eq 5 ]
    then
        echo "break the loop"
        break
    fi
done

for i in {1..10}
do 
    echo "$i"
    if [ $i -eq 5 ]
    then
        echo "break the loop"
        continue
    fi
done
