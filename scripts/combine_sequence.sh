#!/bin/bash

# Directorios
RAW_DIR="/home/paulinamasser/bioinformatics/phylogenics-project/data/raw"
OUTPUT_DIR="/home/paulinamasser/bioinformatics/phylogenics-project/data/raw"

# Combinar las secuencias
cat $RAW_DIR/*.fasta > $OUTPUT_DIR/combined_sequences.fasta

echo "Secuencias combinadas en $OUTPUT/combined_sequences.fasta"
