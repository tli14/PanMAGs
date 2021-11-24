# 2. Rename .gff files from Prokka results.

## gen_gff.sh

cat << EOF> gff.sh
#!/bin/sh
while read gff_list
do
        mv \$gff_list "\$( dirname "\$gff_list" ).gff"
done <\$1
EOF>
