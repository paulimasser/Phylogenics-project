#!/bin/bash

# Directorios 
INPUT="/home/paulinamasser/bioinformatics/phylogenics-project/data/raw/clean_sequences.fasta"
ALIGNED_DIR="/home/paulinamasser/bioinformatics/phylogenics-project/data/aligned"

mafft \
	--localpair \
	--maxiterate 1000 \
	--adjustdirection \
	--leavegappyregion \
	--op 3 \
	--ep 1 \
	 $INPUT > $ALIGNED_DIR/aligned_sequences.fasta

# Verificacion
echo "Longitud alineamiento: $(bioawk -c fastx '{print length($seq); exit}' $ALIGNED_DIR/aligned_sequences.fasta) bp"


echo "Alineamiento completado. Resultado en $ALIGNED_DIR/aligned-sequences.fasta"


