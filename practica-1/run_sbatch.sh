#!/bin/bash
# File              : run_sbatch.sh
# Author            : David Barcene <dbarcene@indicasat.org>
# Date              : 23.02.2026
# Last Modified Date: 23.02.2026
# Last Modified By  : David Barcene <dbarcene@indicasat.org>

READS_DIR="reads"

for READ1 in ${READS_DIR}/*_1.fq; do
	# Strip filename to get sample name
	FILENAME=$(basename "$READ1")
	MUESTRA=${FILENAME%_1.fq}
			        
	echo "Submitting job for sample: ${MUESTRA}"
	    
	# Launch the processing script and pass the sample
	# name as an argument
	sbatch --job-name="$MUESTRA" sample_proc.sh "$MUESTRA"
done
