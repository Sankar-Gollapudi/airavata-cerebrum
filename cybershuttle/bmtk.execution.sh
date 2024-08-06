#!/bin/sh
#SBATCH -o scheduler_stdout.txt # Name of stdout output file(%j expands to jobId)
#SBATCH -e scheduler_stderr.txt # Name of stderr output file(%j expands to jobId)
#SBATCH --partition=shared # submit to the 'large' queue for jobs > 256 nodes
#SBATCH -J NGBW-JOB-PY_EXPANSE-3EB7FAF45A92482DAAD5AC10BAB610F7 # Job name
#SBATCH -t 00:30:00 # Run time (hh:mm:ss) - 1.5 hours
#SBATCH --mail-user=nsgprod@sdsc.edu
#SBATCH --mail-type=begin
#SBATCH --mail-type=end
#The next line is required if the user has more than one project
# #SBATCH -A A-yourproject # Allocation name to charge job against
#SBATCH -A csd403
# #SBATCH -A csd403 # Allocation name to charge job against ..add account after lib.email
#SBATCH --cpus-per-task=1
#SBATCH --nodes=1 # Total number of nodes requested (16 cores/node)
#SBATCH --ntasks-per-node=1 # Total number of mpi tasks requested
#SBATCH --mem=1G
#source $HOME/.bashrc We probably dont need this

#done in prejob commands
#module load singularity

#done in prejob
#cd #To config file

#SINGULARITY_CONTAINER="/export/BMTK_con.sif"

echo Entered execution file

CURRENT_DIR=$(pwd)
COMPILE=$(echo *.py)

singularity exec --bind /export:/export /export/BMTK_con2.sif python $CURRENT_DIR/$COMPILE

mkdir -p $CURRENT_DIR/output

RUN=$(echo run*net.py)
CONFIG=$(echo *.json)

singularity exec --bind /export:/export /export/BMTK_con2.sif python3 $CURRENT_DIR/$RUN $CURRENT_DIR/$CONFIG

echo Simulation finished at `date`
tar -czvf output.tar.gz $CURRENT_DIR/output