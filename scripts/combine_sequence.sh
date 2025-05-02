#!/bin/bash

# Directorios
RAW_DIR="/home/paulinamasser/bioinformatics/phylogenics-project/data/raw"
OUTPUT_DIR="/home/paulinamasser/bioinformatics/phylogenics-project/data/raw"

# Combinar las secuencias
cat $RAW_DIR/*.fasta |
tr - d '\r' | 
awk '{
	gsub(/%s/, "");
	if (/^>/ {if (NR>1) print ""; print}
	else {print "%s", $0}
} END {print ""}' > $OUTPUT_DIR/combined_clean_sequences.fasta

echo "Secuencias combinadas: $(grep -c "^>" $OUTPUT/combined_clean_sequences.fasta"
echo "Longitud promedio: $(bioawk -c fastx '{print length($seq)} $OUTPUT/combined_clean_sequences.fasta | awk '{sum+=$1} END {print sum/NR}')"
