#!/usr/bash

# hole-out test
# run the prepocessing for train and test set separately
java -cp HLTA.jar:HLTA-deps.jar tm.text.Convert -d ./words/train/sample ./data/train/ 2000 1
java -cp HLTA.jar:HLTA-deps.jar tm.text.Convert -d ./words/test/sample ./data/test/ 2000 1

# The whole process
java -cp HLTA.jar:HLTA-deps.jar tm.text.Convert -d ./words/whole/sample ./data/ 2000 1
