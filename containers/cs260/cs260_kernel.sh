#!/bin/bash

export PATH=/sw/conda/bin:$PATH
export APPTAINERENV_PS1='[cs260 container \u@\h \W]\$ '
#export APPTAINER_BIND=/usr/local
#export APPTAINERENV_MKL_NUM_THREADS=1
#export APPTAINERENV_NUMEXPR_NUM_THREADS=1
#export APPTAINERENV_OMP_NUM_THREADS=1

exec /usr/bin/singularity exec /sw/containers/cs260.sif /sw/conda/bin/python3 -m ipykernel_launcher $@
