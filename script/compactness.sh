#!/bin/bash

#SBATCH -J hlta_com
#SBATCH -p general
#SBATCH -N 1 -n 20
#SBATCH -t 4:00:00

# BROKEN: it needs extra dependencies 
# batch version
#echo "*************** hlta_model_batch **************"
#java -cp HLTA.jar:HLTA-deps.jar tm.hlta.TopicCompactness batch.nodes.json ./words/full/sample.sparse.txt GoogleNews-vectors-negative300.bin

# step version (10000 sampled data cases, 1000 minibatch size)
#echo "*************** hlta_model_step **************"
#java -cp HLTA.jar:HLTA-deps.jar tm.hlta.TopicCompactness step.nodes.json ./words/full/sample.sparse.txt GoogleNews-vectors-negative300.bin

python compactness.py GoogleNews-vectors-negative300.bin batch.nodes.json step.nodes.json
