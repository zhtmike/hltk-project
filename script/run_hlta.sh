#!/usr/bash

# hole-out test
# run the prepocessing for train and test set separately
#java -cp HLTA.jar:HLTA-deps.jar tm.text.Convert -d ./words/train/sample ./data/train/ 2000 1
#java -cp HLTA.jar:HLTA-deps.jar tm.text.Convert -d ./words/test/sample ./data/test/ 2000 1

# build the model
#java -cp HLTA.jar:HLTA-deps.jar tm.hlta.HLTA ./words/train/sample.sparse.txt 50 hlta_model

# calculate the loglikelihood
#java -cp HLTA.jar:HLTA-deps.jar tm.hlta.Doc2VecAssignment --broad hlta_model.bif ./words/test/sample.sparse.txt heldout
# TODO: calculate the loglikelihood

# ===========================
# The whole process
java -cp HLTA.jar:HLTA-deps.jar tm.text.Convert -d ./words/whole/sample ./data/ 2000 1
java -cp HLTA.jar:HLTA-deps.jar tm.hlta.HLTA ./words/whole/sample.sparse.txt 50 hlta_model_full
java -cp HLTA.jar:HLTA-deps.jar tm.hlta.ExtractTopicTree ./tree/tree hlta_model_full.bif ./words/whole/sample.sparse.txt
