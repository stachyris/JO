#PBS -N psmc-aut-8c
#PBS -q iiserq
#PBS -l select=1:ncpus=40
#PBS -V
#PBS -o psmc-aut-8c.o
#PBS -e psmc-aut-8c.err

ncores=`cat $PBS_NODEFILE|wc -l`


#source /home/app/intel/compilers_and_libraries/linux/bin/compilervars.sh intel64
#source /home/app/intel/compilers_and_libraries/linux/mpi/bin64/mpivars.sh intel64
#source /home/app/intel/compilers_and_libraries/linux/mkl/bin/mklvars.sh intel64

cd $PBS_O_WORKDIR
cd /home/harshakumar/Meghana_New_Dir/WGS_Data_and_Analysis/gatk/JO_ensembl_genome

PSMC_path=/home/harshakumar/Meghana_New_Dir/softs/psmc

$PSMC_path/utils/fq2psmcfa -q20 JO1_diploid2.fq.gz > JO1_autosomes.psmcfa

$PSMC_path/psmc -N25 -t9 -r5 -p "26*2+4+7+1" -o JO1_autosomes-8c.psmc JO1_autosomes.psmcfa

$PSMC_path/utils/psmc2history.pl JO1_autosomes-8c.psmc | $PSMC_path/utils/history2ms.pl > ms-cmd-8c.sh

#$PSMC_path/utils/psmc_plot.pl -u 2.8e-09 -g 2 -p JO1_autosomes-8c JO1_autosomes-8c.psmc
