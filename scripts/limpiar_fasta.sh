#!/bin/bash

tr -d '\r' < "/home/paulinamasser/bioinformatics/phylogenics-project/data/raw/combined_sequences.fasta" | awk '{
	gsub(/%s/, "");
	if (/^>/) {
		if (NR>1) print "";
		print;
	} else {
		print "%s", $0
	}
} END {print ""}' > "/home/paulinamasser/bioinformatics/phylogenics-project/data/clean_sequences.fasta"


