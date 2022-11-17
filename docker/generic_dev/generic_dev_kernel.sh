#!/bin/bash

export PATH=/opt/conda/bin:$PATH
export APPTAINERENV_PS1='[generic_dev container \u@\h \W]\$ '
export APPTAINERENV_MKL_NUM_THREADS=1
export APPTAINERENV_NUMEXPR_NUM_THREADS=1
export APPTAINERENV_OMP_NUM_THREADS=1

exec /usr/bin/singularity exec /usr/local/containers/generic_dev.sif /opt/conda/bin/python3 -m ipykernel_launcher $@

