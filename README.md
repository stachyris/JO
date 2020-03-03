# JO
jungle owlet code

Following the GATK guide from https://imbs-hl.github.io/illumina_seq.html
1. Converting the raw fq.gz files to ubam:
        a. This script file is called - fastq_to_ubam-2.sh
        b. Most important thing is adding the read group
        c. Got details on this from https://gatkforums.broadinstitute.org/gatk/discussion/6472/read-groups#latest; https://toolshed.g2.bx.psu.edu/repository/display_tool?repository_id=c45d6c51a4fcfc6c&render_repository_actions_for=tool_shed&tool_config=%2Fsrv%2Ftoolshed%2Fmain%2Fvar%2Fdata%2Frepos%2F000%2Frepo_259%2Fpicard_AddOrReplaceReadGroups.xml&changeset_revision=ab1f60c26526
        d. So added RG info from the headers in the fq.gz
        e. Tried running this script on the cluster - through the submit_fq2ubam.sh script. However, while this does produce log files - fq2ubam.o, fq2ubam.err, there was no output being generated. And I couldn't see any error either!! I did try a couple of times!
        f. So then I ran the scrpt from the prompt directly.
        g. This worked and gave and output file - JO1_unmapped.bam
        h. Tried giving extension '.ubam' but in an earlier log it said the extension is not recognised. It may have worked, but I still just changed it.

2. Marking adapters in the ubam:
        a. This seemed simple enough, it just looks for illumina adapters.
        b. Script is mark_adapters_in_unmapped_bam.sh
        c. It generates two output files -
                 one is the same ubam, but with adapters marked (XT) - JO1.adaptersmarked_unmapped.bam
                 the other is a text file with a histogram of sizes of adapters marked - ID.adaptersmarked.txt
        d. This script was run through nohup - so there's a log file - nohup_mark_adapters.out

3. Converting this ubam back to a single, interleaved fastq file:
        a. This script - ubam_back_to_fastq.sh - converts the ubam to fq, but changes quality of adapter region to 2
        b. The output file is called - JO1.adaptersmarked.fastq
        c. The nohup log file is called - nohup_ubam_2_fq_log.out

4. Map this fastq file to the reference using bwa-mem:
        a. This script I submitted to queue because it's a long process
        b. Script file is called - map_fq_2_ref.sh (submit file is submit_map_fq_2_ref.sh)
        c. The output mapped file is - JO1.adaptersmarked.aligned.sam (151 Gb)
        d. The log files are called - map_fq_to_ref.err, map_fq_to_ref.o

5. Merge the sam file with the uBAM file so that the metadata saved in the ubam file (which gets lost from the fq) is incorporated into the mapped file:
        a. The script file is called - merge_ubam_with_mapped_sam.sh
        b. The options indicated made sense, so were kept, based on the online webpage
        c. The output file is called JO1.adaptersmarked.aligned.merged.bam
        d. The submit script is called - submit_merge_ubam_with_mapped_sam.sh

        e. Actually, I tried multiple iterations but kept getting errors related to space. So there are actually multiple script files in this folder for this step, which are all the different combinations I tried -  merge_ubam_with_mapped_sam*.sh - with 1,2,3 etc. versions. But they didn't work.
        f. Finally IT people ran this script for me - test1.sh (log files are test1.err, test1.o)
        g. This gave me the output - JO1.adaptersmarked.aligned.merged.bam
        h. The reason this script worked is because they seem to have removed one extra line from this code - #source /opt/intel/parallel_studio_xe_2017/psxevars.sh

6. Mark duplicates:
        a. Again, this step also ran into cluster issues. Part of it is my mistake. First of all, I didn't need to run two separate codes - one for the actual code - which I saved as a script, and one for submitting my script. I could just copy the contents of my script into the submitting script itself. The second thing was that I was running a serial job as a parallel job (This is the mpirun part, which was not needed. And so, one of the #lines which gave the path to parallel something also needed to be removed.
        b. So I did all this based on their instructions and created a script file - mark_duplicates.sh. However, this script again just went to queue. It didn't run.
        c. So I contacted the IT people again and they tried changing the number of cores (ncpus). My earlier version said 10, they later tried with 40. Eventually, theirs worked (with ncpus = 10, which was my original setting!!). No idea why!
        d. This script that they finally ran is called test2.sh. The log files are test2.o, test2.err.
        e. The output file is - JO1.adaptersmarked.aligned.merged.test2.bam, and the metrics file - JO1.test2.metrics.txt. And index was also created, called - JO1.adaptersmarked.aligned.merged.test2.bai.

7. Indel Realignment - ** NOT RUNNING THIS **
        a. I first tried creating targets for realignment (see script - indel_realignment_identify_regions.sh)
        b. However, I got an error - gatk 4 doesn't recognize this option at all - RealignerTargetCreator
        c. This led me to this discussion (see link below) about why, with new versions and while using haplotype caller - they no longer recommend this step
        d. link - https://github.com/broadinstitute/gatk-docs/blob/master/blog-2012-to-2019/2016-06-21-Changing_workflows_around_calling_SNPs_and_indels.md?id=7847

8. ALSO NOT RUNNING recalibration of base qualities - we don't have any truth data

9. QUALITY CHECK -
        a. They recommend the first qc check (using fastqc) on the raw reads - already done - see /home/harshakumar/Meghana_New_Dir/WGS_Data_and_Analysis/WGS_data_raw/FastQC_reports/
        b. The second check is recommended after marking adapters and duplicate reads

10. Depth check
        a. This option is now not available in the latest version gatk4... onwards. Had to find older archived versions from https://console.cloud.google.com/storage/browser/gatk-software/package-archive/gatk/?pli=1
        b. So downloaded an archived older version (in /home/harshakumar/Meghana_New_Dir/softs/GenomeAnalysisTK-3.8-1-0-gf15c1c3ef/) which just comes with a jar file. The script file was - depth_of_coverage.sh
        c. However, when submitted to qsub - it generated empty (size 0) output files!
        d. So I gave up and ran it on prompt directly the following code -

java -jar /home/harshakumar/Meghana_New_Dir/softs/GenomeAnalysisTK-3.8-1-0-gf15c1c3ef/GenomeAnalysisTK.jar -T DepthOfCoverage -nt 30 -R /home/harshakumar/Meghana_New_Dir/Reference_Genomes_NCBI/GCF_003259725.1_athCun1_genomic.fna -I JO1.adaptersmarked.aligned.merged.test2.bam -o depth_stats --omitIntervalStatistics --omitDepthOutputAtEachBase

        e. So there are 4 output files, all starting with the prefix - depth_stats*
        f. The average depth (when mapped to Athene cunicularia is 30X)

## Following this page now - https://github.com/lh3/psmc/blob/master/README
## And this - https://informatics.fas.harvard.edu/psmc-journal-club-walkthrough.html

11. Creating a consensus fasta file with SNP positions marked - script file consensus_from_final_bam-new.sh
        a. This command is used to first call SNPs from the bam - using first the bcftools mpileup followed by bcftools call - This information is then passed on to vcfutils to convert this to a fasta-like format.
        b. The document mentioned above says this - I'm just following at this point

        "Here option -d sets and minimum read depth and -D sets the maximum. It is recommended to set -d to a third of the average depth and -D to twice.  Program `fq2psmcfa' transforms the consensus sequence into a fasta-like format where the i-th character in the output sequence indicates whether there is at least one heterozygote in the bin [100i, 100i+100)"

        c. This command uses samtools, bcftools and vcfutils in the original document and I have created the script consensus_from_final_bam-old.sh
        d. However, the use of samtools mpileup is now depracated, as is bcftools view, with the newer versions of these software
        e. consensus_from_final_bam-new.sh script therefore uses the new recommended commands (not from the document above, but from the software documentation.
        f. The output is JO1_diploid.fq.gz

12. PSMC commands - This is the last set of commands
        a. psmc_commands.sh (or some variants of this commands - with altered parameters)
        b. the main output is the .psmc file - no idea how to interpret this!!
        c. However, the plot function directly takes this in and then translates it to a graph using the mutation rate and generation time specified.
        d. This last command (the plot command) doesn't seem to be working from the queue (what did I do wrong??) but it runs from the prompt.
        e. All the .eps files, I pulled out and converted to pdf online.

