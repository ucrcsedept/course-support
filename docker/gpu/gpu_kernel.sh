#!/bin/bash

export PATH=/opt/conda/bin:$PATH
export APPTAINERENV_PS1='[gpu container \u@\h \W]\$ '
export APPTAINERENV_MKL_NUM_THREADS=1
export APPTAINERENV_NUMEXPR_NUM_THREADS=1
export APPTAINERENV_OMP_NUM_THREADS=1

exec /usr/bin/singularity exec /usr/local/containers/gpu.sif /opt/conda/bin/python3 -m ipykernel_launcher $@

