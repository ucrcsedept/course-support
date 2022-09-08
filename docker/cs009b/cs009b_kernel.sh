#!/bin/bash

export PATH=/opt/conda/bin:$PATH
export SINGULARITYENV_PS1='[cs009b container \u@\h \W]\$ '
export SINGULARITYENV_MKL_NUM_THREADS=1
export SINGULARITYENV_NUMEXPR_NUM_THREADS=1
export SINGULARITYENV_OMP_NUM_THREADS=1

exec /usr/bin/singularity exec /usr/local/containers/cs009b.sif /opt/conda/bin/python3 -m ipykernel_launcher $@

