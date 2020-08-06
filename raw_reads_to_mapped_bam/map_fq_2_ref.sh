#PBS -N mapping_bwa
#PBS -q iiserq
#PBS -l select=1:ncpus=40
#PBS -V
#PBS -o mapping_bwa.o
#PBS -e mapping_bwa.err

ncores=`cat $PBS_NODEFILE|wc -l`


#source /home/app/intel/compilers_and_libraries/linux/bin/compilervars.sh intel64
#source /home/app/intel/compilers_and_libraries/linux/mpi/bin64/mpivars.sh intel64
#source /home/app/intel/compilers_and_libraries/linux/mkl/bin/mklvars.sh intel64
cd $PBS_O_WORKDIR
cd /home/harshakumar/Meghana_New_Dir/WGS_Data_and_Analysis/gatk/JO_ensembl_genome

bwa mem -t 32 -p -M /home/harshakumar/Meghana_New_Dir/Reference_Genomes_NCBI/ensmbl_ref_file_athCun1/Athene_cunicularia.athCun1.dna.toplevel.fa ../JO1.adaptersmarked.fastq > JO1.adaptersmarked.aligned.ensembl.sam
