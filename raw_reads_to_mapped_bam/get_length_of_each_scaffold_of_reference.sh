~/Meghana_New_Dir/softs/bioawk/bioawk -c fastx '{print ">" $name ORS length($seq)}' ~/Meghana_New_Dir/Reference_Genomes_NCBI/ensmbl_ref_file_athCun1/Athene_cunicularia.athCun1.dna.toplevel.fa | paste - - > length_of_each_scaffold_of_ath_cun_ensembl.txt

# OR

awk '/^>/{if (l!="") print l; print; l=0; next}{l+=length($0)}END{print l}'  ~/Meghana_New_Dir/Reference_Genomes_NCBI/ensmbl_ref_file_athCun1/Athene_cunicularia.athCun1.dna.toplevel.fa > length_of_each_scaffold_of_ath_cun_ensembl-awk.txt

less ~/Meghana_New_Dir/Reference_Genomes_NCBI/ensmbl_ref_file_athCun1/GCA_003259725.1_sequence_report.txt | grep 'Chromosome' | grep 'chrZ' > chromosome_scaffolds_Z.txt

less ~/Meghana_New_Dir/Reference_Genomes_NCBI/ensmbl_ref_file_athCun1/GCA_003259725.1_sequence_report.txt | grep 'Chromosome' | grep -v 'chrZ' > chromosome_scaffolds_aut.txt


cut -f1 chromosome_scaffolds_Z.txt | grep -f - length_of_each_scaffold_of_ath_cun_ensembl.txt | sed 's,>,,' | sed 's,\.1,\.1\t0,' > chromosome_scaffolds_Z.bed
cut -f1 chromosome_scaffolds_aut.txt | grep -f - length_of_each_scaffold_of_ath_cun_ensembl.txt | sed 's,>,,' | sed 's,\.1,\.1\t0,' > chromosome_scaffolds_aut.bed
