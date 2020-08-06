#PBS -N mark_dups
#PBS -q iiserq
#PBS -l select=1:ncpus=40
#PBS -V
#PBS -o mark_dups.o
#PBS -e mark_dups.err

ncores=`cat $PBS_NODEFILE|wc -l`


#source /home/app/intel/compilers_and_libraries/linux/bin/compilervars.sh intel64
#source /home/app/intel/compilers_and_libraries/linux/mpi/bin64/mpivars.sh intel64
#source /home/app/intel/compilers_and_libraries/linux/mkl/bin/mklvars.sh intel64
cd $PBS_O_WORKDIR
cd /home/harshakumar/Meghana_New_Dir/WGS_Data_and_Analysis/gatk/JO_ensembl_genome

java -jar ~/Meghana_New_Dir/softs/picard.jar MarkDuplicates INPUT=JO1.adaptersmarked.aligned.merged.ensembl.bam OUTPUT=JO1.adaptersmarked.aligned.merged.dupmarked.ensembl.bam METRICS_FILE=JO1.adaptersmarked.aligned.merged.dupmarked.ensembl.metrics.txt CREATE_INDEX=true 
