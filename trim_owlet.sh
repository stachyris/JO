READ_1=$(echo ~/Meghana_New_Dir/WGS_Data_and_Analysis/WGS_data_raw/Jungle_owlet/*_R1.fastq.gz)
READ_2=$(echo ~/Meghana_New_Dir/WGS_Data_and_Analysis/WGS_data_raw/Jungle_owlet/*_R2.fastq.gz)

OUTDIR=~/Meghana_New_Dir/WGS_Data_and_Analysis/WGS_Trimmed_Files/JO1/

~/Meghana_New_Dir/softs/TrimGalore-0.6.5/trim_galore --quality 30 --phred33 --stringency 2 --length 30 --max_n 2 --trim-n \
--output_dir $OUTDIR \
--paired --retain_unpaired \
$READ_1 $READ_2
