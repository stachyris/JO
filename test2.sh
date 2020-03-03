#PBS -N test2
#PBS -q iiserq
#PBS -l select=1:ncpus=10
#PBS -V
#PBS -o test2.o
#PBS -e test2.err

ncores=`cat $PBS_NODEFILE|wc -l`


#source /home/app/intel/compilers_and_libraries/linux/bin/compilervars.sh intel64
#source /home/app/intel/compilers_and_libraries/linux/mpi/bin64/mpivars.sh intel64
#source /home/app/intel/compilers_and_libraries/linux/mkl/bin/mklvars.sh intel64
cd $PBS_O_WORKDIR
cd /home/harshakumar/Meghana_New_Dir/WGS_Data_and_Analysis/gatk


java -jar /home/Workshop-Genomics/softs/picard.jar MarkDuplicates INPUT=JO1.adaptersmarked.aligned.merged.bam OUTPUT=JO1.adaptersmarked.aligned.merged.test2.bam METRICS_FILE=JO1.test2.metrics.txt CREATE_INDEX=true
