#!/bin/bash

for file in ~/bioinformatics/phylogenics-project/data/raw/*.fasta; do
	length=$(grep -v "^>" "$file" | tr -d '\n' | wc -c)
	filename=$(basename "$file")
	echo "$filename: $length bp"
done
-
