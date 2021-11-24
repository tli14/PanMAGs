# Generate script to rename the .faa files.

# gen_faa.sh

cat << EOF> faa.sh
#!/bin/sh
while read faa_list
do
        mv \$faa_list "\$( dirname "\$faa_list" ).faa"
done <\$1
EOF>
