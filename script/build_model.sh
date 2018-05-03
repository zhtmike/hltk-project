#!/usr/bash

#SBATCH -J hlta
#SBATCH -p general
#SBATCH -N 1 -n 20
#SBATCH -t 24:00:00

# batch version
echo "*************** hlta_model_train_batch **************"
java -cp HLTA.jar:HLTA-deps.jar tm.hlta.HLTA --show-log-time --struct-use-all ./words/train/sample.sparse.txt 50 model_train_batch

# step version (10000 sampled data cases, minibatch size)
echo "*************** hlta_model_train_step **************"
java -cp HLTA.jar:HLTA-deps.jar tm.hlta.HLTA --show-log-time -s 10000 -g 1000 ./words/train/sample.sparse.txt 100 model_train_step

# batch version
echo "*************** hlta_model_full_batch **************"
java -cp HLTA.jar:HLTA-deps.jar tm.hlta.HLTA --show-log-time --struct-use-all ./words/full/sample.sparse.txt 50 model_full_batch

# step version (10000 sampled data cases, minibatch size)
echo "*************** hlta_model_full_step **************"
java -cp HLTA.jar:HLTA-deps.jar tm.hlta.HLTA --show-log-time -s 10000 -g 1000 ./words/full/sample.sparse.txt 100 model_full_step
