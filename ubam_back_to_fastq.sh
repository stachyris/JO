java -jar /home/Workshop-Genomics/softs/picard.jar SamToFastq \
  INPUT=JO1.adaptersmarked_unmapped.bam \
  FASTQ=JO1.adaptersmarked.fastq \
  CLIPPING_ATTRIBUTE=XT \
  CLIPPING_ACTION=2 \
  INTERLEAVE=true
