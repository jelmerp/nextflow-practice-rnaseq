#!/bin/bash
#SBATCH --account=PAS0471
#SBATCH --time=1:00:00
#SBATCH --mail-type=END,FAIL
#SBATCH --output=slurm-nf-rnaseq-%j.out
set -euo pipefail

# Load the Nextflow Conda environment
module load miniconda3/24.1.2-py310
conda activate /fs/ess/PAS0471/jelmer/conda/nextflow

# Run the workflow
WORKFLOW=main.nf    # Eventually, this should point to a GitHub repo
nextflow run $WORKFLOW -ansi-log false -resume "$@"
