#PBS -N consensus_from_bam-new
#PBS -q iiserq
#PBS -l select=1:ncpus=40
#PBS -V
#PBS -o consensus_from_bam-new.o
#PBS -e consensus_from_bam-new.err

ncores=`cat $PBS_NODEFILE|wc -l`


#source /home/app/intel/compilers_and_libraries/linux/bin/compilervars.sh intel64
#source /home/app/intel/compilers_and_libraries/linux/mpi/bin64/mpivars.sh intel64
#source /home/app/intel/compilers_and_libraries/linux/mkl/bin/mklvars.sh intel64

cd $PBS_O_WORKDIR
cd /home/harshakumar/Meghana_New_Dir/WGS_Data_and_Analysis/gatk

REFERENCE=/home/harshakumar/Meghana_New_Dir/Reference_Genomes_NCBI/GCF_003259725.1_athCun1_genomic.fna
BCFTOOLS=/home/harshakumar/Meghana_New_Dir/softs/bcftools-1.10.1/bin/bin/bcftools
VCFUTILS=//home/harshakumar/Meghana_New_Dir/softs/bcftools-1.10.1/bin/bin/vcfutils.pl

$BCFTOOLS mpileup -C50 -f $REFERENCE JO1.adaptersmarked.aligned.merged.test2.bam | $BCFTOOLS call -c - | $VCFUTILS vcf2fq -d 10 -D 100 | gzip > JO1_diploid.fq.gz
