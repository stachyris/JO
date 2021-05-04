#PBS -N mark_adaters
#PBS -q iiserq
#PBS -l select=1:ncpus=40
#PBS -V
#PBS -o mark_adapters.o
#PBS -e mark_adapters.err

ncores=`cat $PBS_NODEFILE|wc -l`


#source /home/app/intel/compilers_and_libraries/linux/bin/compilervars.sh intel64
#source /home/app/intel/compilers_and_libraries/linux/mpi/bin64/mpivars.sh intel64
#source /home/app/intel/compilers_and_libraries/linux/mkl/bin/mklvars.sh intel64
cd $PBS_O_WORKDIR
cd /home/harshakumar/Meghana_New_Dir/WGS_Data_and_Analysis/gatk/JO_ensembl_genome

java -jar /home/Workshop-Genomics/softs/picard.jar MarkIlluminaAdapters \
  INPUT=JO1_unmapped.bam \
  OUTPUT=JO1.adaptersmarked_unmapped.bam \
  METRICS=ID-JO1.adaptersmarked.txt
