#!/bin/bash

# Directorios 
INPUT="/home/paulinamasser/bioinformatics/phylogenics-project/data/raw/clean_sequences.fasta"
ALIGNED_DIR="/home/paulinamasser/bioinformatics/phylogenics-project/data/aligned"

mafft  --localpair --maxiterate 1000 --thread 8 $INPUT > $ALIGNED_DIR/aligned_sequences.fasta

echo "Alineamiento completado. Resultado en $ALIGNED_DIR/aligned-sequences.fasta"


