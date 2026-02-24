#!/bin/bash
# File              : sample_proc.sh
# Author            : David Barcene <dbarcene@indicasat.org>
# Date              : 23.02.2026
# Last Modified Date: 24.02.2026
# Last Modified By  : David Barcene <david.barcene@utp.ac.pa>
#SBATCH --job-name=bio_pipe
#SBATCH --cpus-per-task=30  

# The sample name is passed as the first argument to the script
if [ -z "$1"  ]; then
	    echo "Error [1]: No sample name provided." 
	    exit 1
fi
	
# Path variables
READS_DIR="./reads"
OUTPUT_DIR="./BAM"
REF="./ref/LpmP_2025_union.fasta"

# Make output dir if doesn't exist yet
mkdir -p $OUTPUT_DIR

MUESTRA=$1
echo "--- Starting Processing for: ${MUESTRA} ---" 

################################# BWA ########################################
# Step 0: BWA 
echo "Step 0: Mapping with BWA"

srun bwa mem -t $SLURM_CPUS_PER_TASK \
	-o ${OUTPUT_DIR}/${MUESTRA}_LpmP.sam \
	${REF} \
	${READS_DIR}/${MUESTRA}_1.fq \
	${READS_DIR}/${MUESTRA}_2.fq 

############################### SAMTOOLS #####################################
# Step 1: Samtools View
echo "Step 1: Samtools View"

srun samtools view -b -@ $SLURM_CPUS_PER_TASK \
	-o ${OUTPUT_DIR}/${MUESTRA}_LpmP_unsorted.bam \
	${OUTPUT_DIR}/${MUESTRA}_LpmP.sam



# Step 2: Samtools Sort
echo "Step 2: Sorting BAM"

srun samtools sort -@ $SLURM_CPUS_PER_TASK \
	-o ${OUTPUT_DIR}/${MUESTRA}_LpmP.bam \
	${OUTPUT_DIR}/${MUESTRA}_LpmP_unsorted.bam



# Step 3: Samtools Index
echo "Step 3: Indexing"
srun samtools index -@ $SLURM_CPUS_PER_TASK \
	${OUTPUT_DIR}/${MUESTRA}_LpmP.bam



# Step 4: Samtools Stats
echo "Step 4: Generating Stats"
srun --output=${OUTPUT_DIR}/${MUESTRA}_stats.txt samtools flagstat -@ $SLURM_CPUS_PER_TASK \
	${OUTPUT_DIR}/${MUESTRA}_LpmP.bam 

echo "--- Finished Processing for: $MUESTRA ---"

