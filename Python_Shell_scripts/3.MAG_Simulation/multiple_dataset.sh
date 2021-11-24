# To generate multiple datasets for testing the dataset variations.

#!/bin/sh
cut="50"
comp="99"
cont="2.0"

for file in {01..50};do
  bash select.sh ${file}
  bash frag.sh ${file} $cut
  bash comp.sh ${file} $cut $comp
  bash cont.sh ${file} $cut $comp $cont
done
