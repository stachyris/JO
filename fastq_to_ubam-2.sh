INDIR=~/Meghana_New_Dir/WGS_Data_and_Analysis/WGS_data_raw/Jungle_owlet/

    R1=$(echo $INDIR*1.fastq.gz)
    R2=$(echo $INDIR*2.fastq.gz)

    echo $R1
    echo $R2



    header=$(zcat $R1 | head -n 1)
    id=$(echo $header | head -n 1 | cut -f 1-4 -d":" | sed 's/@//' | sed 's/:/_/g')

## specific to JO
    sm=JO1

    echo $id
    echo $sm




java -jar /home/Workshop-Genomics/softs/picard.jar FastqToSam \
  F1=/home/harshakumar/Meghana_New_Dir/WGS_Data_and_Analysis/WGS_data_raw/Jungle_owlet/JO1_R1.fastq.gz \
  F2=/home/harshakumar/Meghana_New_Dir/WGS_Data_and_Analysis/WGS_data_raw/Jungle_owlet/JO1_R2.fastq.gz \
  OUTPUT=JO1_unmapped.bam \
  READ_GROUP_NAME=$(echo $id) \
  SAMPLE_NAME=JO1 \
  LIBRARY_NAME=Illumina_WGS_JO1 \
  PLATFORM_UNIT=$(echo $id) \
  PLATFORM=Illumina
