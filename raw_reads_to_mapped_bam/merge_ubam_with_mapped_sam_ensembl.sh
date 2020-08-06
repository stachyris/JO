#PBS -N merge_ubam_sam
#PBS -q iiserq
#PBS -l select=1:ncpus=40
#PBS -V
#PBS -o merge_ubam_sam.o
#PBS -e merge_ubam_sam.err

ncores=`cat $PBS_NODEFILE|wc -l`


#source /home/app/intel/compilers_and_libraries/linux/bin/compilervars.sh intel64
#source /home/app/intel/compilers_and_libraries/linux/mpi/bin64/mpivars.sh intel64
#source /home/app/intel/compilers_and_libraries/linux/mkl/bin/mklvars.sh intel64
cd $PBS_O_WORKDIR
cd /home/harshakumar/Meghana_New_Dir/WGS_Data_and_Analysis/gatk/JO_ensembl_genome

java -jar ~/Meghana_New_Dir/softs/picard.jar MergeBamAlignment ALIGNED_BAM=JO1.adaptersmarked.aligned.ensembl.sam UNMAPPED_BAM=../JO1.adaptersmarked_unmapped.bam OUTPUT=JO1.adaptersmarked.aligned.merged.ensembl.bam REFERENCE_SEQUENCE=/home/harshakumar/Meghana_New_Dir/Reference_Genomes_NCBI/ensmbl_ref_file_athCun1/Athene_cunicularia.athCun1.dna.toplevel.fa MAX_INSERTIONS_OR_DELETIONS=-1 PRIMARY_ALIGNMENT_STRATEGY=MostDistant ATTRIBUTES_TO_RETAIN=XS

