#PBS -N depth_stats_raw
#PBS -q iiserq
#PBS -l select=1:ncpus=40
#PBS -V
#PBS -o depth_stats_raw.o
#PBS -e depth_stats_raw.err

ncores=`cat $PBS_NODEFILE|wc -l`


#source /home/app/intel/compilers_and_libraries/linux/bin/compilervars.sh intel64
#source /home/app/intel/compilers_and_libraries/linux/mpi/bin64/mpivars.sh intel64
#source /home/app/intel/compilers_and_libraries/linux/mkl/bin/mklvars.sh intel64
cd $PBS_O_WORKDIR
cd /home/harshakumar/Meghana_New_Dir/WGS_Data_and_Analysis/gatk/JO_ensembl_genome

java -jar /home/harshakumar/Meghana_New_Dir/softs/GenomeAnalysisTK-3.8-1-0-gf15c1c3ef/GenomeAnalysisTK.jar -T DepthOfCoverage -nt 30 -R /home/harshakumar/Meghana_New_Dir/Reference_Genomes_NCBI/ensmbl_ref_file_athCun1/Athene_cunicularia.athCun1.dna.toplevel.fa -I JO1.adaptersmarked.aligned.merged.dupmarked.ensembl.bam -o depth_stats_raw --omitIntervalStatistics --omitDepthOutputAtEachBase
