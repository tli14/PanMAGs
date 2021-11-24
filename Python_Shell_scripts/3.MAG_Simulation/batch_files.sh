## Batch files for simulation

# batch_sim.sh (for fragmentation dataset)
#!/bin/sh
while read filename col
do
        python fragmentation.py $filename $col
done < $1


# batch_remove.sh (for incompleteness dataset)
#!/bin/sh
while read filename col
do
        python incompleteness.py $filename $col
done < $1


# batch_cont.sh (for contamination dataset)
#!/bin/sh
while read filename col
do
        python contamination.py $filename $col # for intraspecies contamination
        python contamination_genus.py $filename $col # for interspecies contamination
done < $1
