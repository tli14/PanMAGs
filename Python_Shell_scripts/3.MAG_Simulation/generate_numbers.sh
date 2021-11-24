## Generate numbers for genome list to assign random fragmentation/incompleteness/contamination numbers.

#!/bin/sh

i=0

while read file
do
        echo $file $i
        ((i++))
done < $1
