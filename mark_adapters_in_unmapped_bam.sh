java -jar /home/Workshop-Genomics/softs/picard.jar MarkIlluminaAdapters \
  INPUT=JO1_unmapped.bam \
  OUTPUT=JO1.adaptersmarked_unmapped.bam \
  METRICS=ID.adaptersmarked.txt
