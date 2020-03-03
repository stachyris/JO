#PBS -N psmc
#PBS -q iiserq
#PBS -l select=1:ncpus=10
#PBS -V
#PBS -o psmc.o
#PBS -e psmc.err

ncores=`cat $PBS_NODEFILE|wc -l`


#source /home/app/intel/compilers_and_libraries/linux/bin/compilervars.sh intel64
#source /home/app/intel/compilers_and_libraries/linux/mpi/bin64/mpivars.sh intel64
#source /home/app/intel/compilers_and_libraries/linux/mkl/bin/mklvars.sh intel64

cd $PBS_O_WORKDIR
cd /home/harshakumar/Meghana_New_Dir/WGS_Data_and_Analysis/gatk

PSMC_path=/home/harshakumar/Meghana_New_Dir/softs/psmc

$PSMC_path/utils/fq2psmcfa -q20 JO1_diploid.fq.gz > JO1_diploid.psmcfa

$PSMC_path/psmc -N25 -t15 -r5 -p "4+25*2+4+6" -o JO1_diploid.psmc JO1_diploid.psmcfa

$PSMC_path/utils/psmc2history.pl JO1_diploid.psmc | $PSMC_path/utils/history2ms.pl > ms-cmd.sh

$PSMC_path/utils/psmc_plot.pl diploid JO1_diploid.psmc

/home/harshakumar/Meghana_New_Dir/softs/psmc/utils/psmc_plot.pl -u 2.8e-09 -g 2 -p test_plot2 JO1_diploid.psmc
