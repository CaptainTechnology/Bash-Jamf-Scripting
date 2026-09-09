

#!/bin/bash

echo "number of argument : $#"
echo "display all argument : $@"
echo "first arg :$1"
echo "second arg :$2"
echo $@

for i in $@
do 
    echo $i
done
