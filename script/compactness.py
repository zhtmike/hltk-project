"""
Mike Cheung 2018-05-04: A modification based on https://github.com/kmpoon/hlta/blob/master/compactness_w2v.py 
"""
__author__ = 'chen zhourong'
import argparse
import json

from gensim.models import KeyedVectors


def flatten(tree, text):
    """
    A DFS search on the trees
    """
    text.append(tree['text'].split())
    if len(tree['children']) == 0:
        return
    else:
        for subtree in tree['children']:
            flatten(subtree, text)
    


def compactness_score(model_path, topic_file_paths):
    """
    model_path:	Word2Vec model file
    topic_file_path:Each line in the file is a topic, represented as a list of words separated by spaces

    Output: Print compactness score for each topic and a final score for all the topics.
    """

    # Loading can be very slow if the model is large.
    # User should consider loading the model just once for all the topic files.
    print("Loading Word2Vec model: " + model_path)
    model = KeyedVectors.load_word2vec_format(model_path, binary=True)
    print("Loading Done.")
    for topic_file_path in topic_file_paths:

        print("Processing topic file: " + topic_file_path)

        # read json file
        with open(topic_file_path, 'r') as f:
            topic_trees = json.load(f)

        # flatten the tree into list
        texts = []
        for topic_tree in topic_trees:
            flatten(topic_tree, texts)

        # meaure the simlilarity and store as result
        result = []
        for line in texts:
            sims = []

            for i, u in enumerate(line):
                if u not in model.vocab:
                    continue
                for v in line[i+1:]:
                    if v in model.vocab:
                        sims.append(model.similarity(u, v))
            if len(sims) > 0:
                result.append(sum(sims) / len(sims))

        if len(result) > 0:
            print("Score:", sum(result) / len(result))
        else:
            print("No topics applicable!")


if __name__ == '__main__':
    # Configure the argument parser
    parser = argparse.ArgumentParser(
        description='COMP5213 Compactness measurment')
    parser.add_argument('model_file', type=str, help='word2vec model file')
    parser.add_argument('infiles', type=str, nargs='+',
                        help='Input topic files (.json)')
    args = parser.parse_args()

    compactness_score(args.model_file, args.infiles)
