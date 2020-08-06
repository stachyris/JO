#PBS -N psmc-aut_boot
#PBS -q iiserq
#PBS -l select=2:ncpus=40
#PBS -V
#PBS -o psmc-aut-8cBt.o
#PBS -e psmc-aut-8cBt.err

ncores=`cat $PBS_NODEFILE|wc -l`


#source /home/app/intel/compilers_and_libraries/linux/bin/compilervars.sh intel64
#source /home/app/intel/compilers_and_libraries/linux/mpi/bin64/mpivars.sh intel64
#source /home/app/intel/compilers_and_libraries/linux/mkl/bin/mklvars.sh intel64

cd $PBS_O_WORKDIR
cd /home/harshakumar/Meghana_New_Dir/WGS_Data_and_Analysis/gatk/JO_ensembl_genome/psmc_bootstrapping/

PSMC_path=/home/harshakumar/Meghana_New_Dir/softs/psmc

#$PSMC_path/utils/fqii2psmcfa -q20 JO1_diploid_aut.fq.gz > JO1_autosomes.psmcfa

$PSMC_path/utils/splitfa ../JO1_autosomes.psmcfa > JO1_aut_split.psmcfa

$PSMC_path/psmc -N25 -t9 -r5 -p "26*2+4+7+1" -o JO1_autosomes-8c.psmc ../JO1_autosomes.psmcfa

seq 100 | xargs -i -n 1 -P 80 echo $PSMC_path/psmc -N25 -t9 -r5 -b -p "26*2+4+7+1" -o JO1_aut_round-{}.psmc JO1_aut_split.psmcfa | sh
cat JO1_autosomes-8c.psmc JO1_aut_round-*.psmc > JO1_aut-8c-combined.psmc

#$PSMC_path/uils/psmc_plot.pl -u 2.8e-09 -g 2 -pY50000 JO1_aut-8c-combined JO1_aut-8c-combined.psmc
