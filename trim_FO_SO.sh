READ_1_FO=$(echo ~/Meghana_New_Dir/WGS_Data_and_Analysis/WGS_data_raw/FO3_R1.fastq.gz)
READ_2_FO=$(echo ~/Meghana_New_Dir/WGS_Data_and_Analysis/WGS_data_raw/FO3_R2.fastq.gz)
READ_1_SO=$(echo ~/Meghana_New_Dir/WGS_Data_and_Analysis/WGS_data_raw/SOT_R1.fastq.gz)
READ_2_SO=$(echo ~/Meghana_New_Dir/WGS_Data_and_Analysis/WGS_data_raw/SOT_R2.fastq.gz)

OUTDIR_FO3=~/Meghana_New_Dir/WGS_Data_and_Analysis/WGS_Trimmed_Files/FO3/
OUTDIR_SOT=~/Meghana_New_Dir/WGS_Data_and_Analysis/WGS_Trimmed_Files/SOT/

~/Meghana_New_Dir/softs/TrimGalore-0.6.5/trim_galore --quality 30 --phred33 --stringency 2 --length 30 --max_n 2 --trim-n \
--output_dir $OUTDIR_FO3 \
--paired --retain_unpaired \
$READ_1_FO $READ_2_FO


~/Meghana_New_Dir/softs/TrimGalore-0.6.5/trim_galore --quality 30 --phred33 --stringency 2 --length 30 --max_n 2 --trim-n \
--output_dir $OUTDIR_SOT \
--paired --retain_unpaired \
$READ_1_SO $READ_2_SO


