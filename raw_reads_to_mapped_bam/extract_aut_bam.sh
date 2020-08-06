#PBS -N extract_autosomes
#PBS -q iiserq
#PBS -l select=1:ncpus=40
#PBS -V
#PBS -o extract_aut_jo.o
#PBS -e extract_aut_jo.err

ncores=`cat $PBS_NODEFILE|wc -l`


#source /home/app/intel/compilers_and_libraries/linux/bin/compilervars.sh intel64
#source /home/app/intel/compilers_and_libraries/linux/mpi/bin64/mpivars.sh intel64
#source /home/app/intel/compilers_and_libraries/linux/mkl/bin/mklvars.sh intel64

cd $PBS_O_WORKDIR
cd /home/harshakumar/Meghana_New_Dir/WGS_Data_and_Analysis/gatk/JO_ensembl_genome

samtools view -b -L chromosome_scaffolds_aut.bed JO1.adaptersmarked.aligned.merged.dupmarked.ensembl.bam > JO1.adaptersmarked.aligned.merged.dupmarked.ensembl_aut.bam
