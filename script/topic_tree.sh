#!/bin/bash

#SBATCH -J hlta_tree
#SBATCH -p general
#SBATCH -N 1 -n 20
#SBATCH -t 8:00:00

# batch version
echo "*************** hlta_model_batch **************"
java -cp HLTA.jar:HLTA-deps.jar tm.hlta.ExtractTopicTree batch model_full_batch.bif ./words/full/sample.sparse.txt

# step version (10000 sampled data cases, 1000 minibatch size)
echo "*************** hlta_model_step **************"
java -cp HLTA.jar:HLTA-deps.jar tm.hlta.ExtractTopicTree full model_full_step.bif ./words/full/sample.sparse.txt
