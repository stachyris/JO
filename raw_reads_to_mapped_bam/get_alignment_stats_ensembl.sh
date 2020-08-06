#PBS -N alignment_stats
#PBS -q iiser
#PBS -l select=1:ncpus=40
#PBS -V
#PBS -o alignment_stats.o
#PBS -e alignment_stats.err

ncores=`cat $PBS_NODEFILE|wc -l`


#source /home/app/intel/compilers_and_libraries/linux/bin/compilervars.sh intel64
#source /home/app/intel/compilers_and_libraries/linux/mpi/bin64/mpivars.sh intel64
#source /home/app/intel/compilers_and_libraries/linux/mkl/bin/mklvars.sh intel64

cd $PBS_O_WORKDIR
cd /home/harshakumar/Meghana_New_Dir/WGS_Data_and_Analysis/gatk/JO_ensembl_genome/

/home/harshakumar/Meghana_New_Dir/softs/samtools-1.10/bin/bin/samtools flagstat JO1.adaptersmarked.aligned.merged.dupmarked.ensembl.bam > alignment_stats_jo.txt
