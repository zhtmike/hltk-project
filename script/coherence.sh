#!/bin/bash

#SBATCH -J hlta_coh
#SBATCH -p general
#SBATCH -N 1 -n 20
#SBATCH -t 4:00:00

# batch version
echo "*************** hlta_model_batch **************"
java -cp HLTA.jar:HLTA-deps.jar tm.hlta.TopicCoherence batch.nodes.json ./words/full/sample.sparse.txt

# step version (10000 sampled data cases, 1000 minibatch size)
echo "*************** hlta_model_step **************"
java -cp HLTA.jar:HLTA-deps.jar tm.hlta.TopicCoherence step.nodes.json ./words/full/sample.sparse.txt
