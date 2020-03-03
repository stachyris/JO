#PBS -N test1
#PBS -q iiserq
#PBS -l select=1:ncpus=10
#PBS -V
#PBS -o test1.o
#PBS -e test1.err

ncores=`cat $PBS_NODEFILE|wc -l`


#source /home/app/intel/compilers_and_libraries/linux/bin/compilervars.sh intel64
#source /home/app/intel/compilers_and_libraries/linux/mpi/bin64/mpivars.sh intel64
#source /home/app/intel/compilers_and_libraries/linux/mkl/bin/mklvars.sh intel64
cd $PBS_O_WORKDIR
cd /home/harshakumar/Meghana_New_Dir/WGS_Data_and_Analysis/gatk


java  -jar /home/Workshop-Genomics/softs/picard.jar MergeBamAlignment \
  ALIGNED_BAM=JO1.adaptersmarked.aligned.sam \
  UNMAPPED_BAM=JO1.adaptersmarked_unmapped.bam \
  OUTPUT=JO1.adaptersmarked.aligned.merged.bam \
  REFERENCE_SEQUENCE=/home/harshakumar/Meghana_New_Dir/Reference_Genomes_NCBI/GCF_003259725.1_athCun1_genomic.fna \
  MAX_INSERTIONS_OR_DELETIONS=-1 \
  PRIMARY_ALIGNMENT_STRATEGY=MostDistant \
  ATTRIBUTES_TO_RETAIN=XS
