java -jar /home/Workshop-Genomics/softs/picard.jar MergeBamAlignment \
  ALIGNED_BAM=JO1.adaptersmarked.aligned.sam \
  UNMAPPED_BAM=JO1.adaptersmarked_unmapped.bam \
  OUTPUT=JO1.adaptersmarked.aligned.merged.bam \
  REFERENCE_SEQUENCE=/home/harshakumar/Meghana_New_Dir/Reference_Genomes_NCBI/GCF_003259725.1_athCun1_genomic.fna \
  MAX_INSERTIONS_OR_DELETIONS=-1 \
  PRIMARY_ALIGNMENT_STRATEGY=MostDistant \
  ATTRIBUTES_TO_RETAIN=XS
