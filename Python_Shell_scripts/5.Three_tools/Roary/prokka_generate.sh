## Generate prokka annotation script.
## prokka_generate.sh

path=$1
cat << EOF> prokka.sh
for f in $path; do
      prokka "$f" --outdir "${f}.prokka"
done
EOF>
