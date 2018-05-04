#!/bin/bash

#SBATCH -J hlta
#SBATCH -p general
#SBATCH -N 1 -n 20
#SBATCH -t 4:00:00

# batch version
echo "*************** hlta_model_train_batch **************"
java -cp HLTA.jar:HLTA-deps.jar PEM model_train_batch.bif words/test/sample.hlcm batch

# step version (10000 sampled data cases, 1000 minibatch size)
echo "*************** hlta_model_train_step **************"
java -cp HLTA.jar:HLTA-deps.jar PEM model_train_step.bif words/test/sample.hlcm step
