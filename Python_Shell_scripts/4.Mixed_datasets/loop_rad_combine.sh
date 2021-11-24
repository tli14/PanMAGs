## Run rad_combine.sh for multiple times.

#!/bin/sh
percent=$1
for i in {1..10};do
  bash rad_combine.sh $percent $i
done
