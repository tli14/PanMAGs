## Generate Roary pan-genome analysis script.
## roary.sh
path1=$1
path2=$2
cat << EOF> i90cd100.sh
#!/bin/sh
roary -f $path1/i90cd100 -i 90 -cd 100 -s -e -n -v $path2/*gff
EOF>
