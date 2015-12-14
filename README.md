# NBSVM
Since I still receive a good number of emails about this project 4 years later,
I decided to put this code on github and write the
instructions better. The code itself is unchanged.
Luckily, there are [several other implementations](#other-implementations) in various languages,
which are a.s. better.

## Running NBSVM
- Download the data and override the empty data directory in root: for example, you should have "./data/rt10662/unigram_rts.mat" if the README is at  "./README.MD"
- Go to src and run the script master.m to produce the results from the paper
- Results and details are logged in resultslog.txt and details.txt, respectively
- A table with all the results is printed, like:


```
AthR	XGraph	BbCrypt	CR	IMDB	MPQA	RT-2k	RTs	subj	
85.13	91.19	99.40	79.97	86.59	86.27	85.85	79.03	93.56	MNB-bigram
84.99	89.96	99.29	79.76	83.55	85.29	83.45	77.94	92.58	MNB-unigram
83.73	86.17	97.68	80.85	89.16	86.72	87.40	77.72	91.74	SVM-bigram
82.61	85.14	98.29	79.02	86.95	86.15	86.25	76.23	90.84	SVM-unigram
87.66	90.68	99.50	81.75	91.22	86.32	89.45	79.38	93.18	NBSVM-bigram
87.94	91.19	99.70	80.45	88.29	85.25	87.80	78.05	92.40	SVM-unigram
```

## The data
- [data](http://www.stanford.edu/~sidaw/projects/data_NB_ACL12.zip) - 404.4MB includes all the data
- [data_small](http://www.stanford.edu/~sidaw/projects/datasmall_NB_ACL12.zip) - 108.5MB
  data_small = data_all - large_IMDB
- For each data set, there is a corresponding folder data/$DatasetName.
- You can find $FeatureType_$DatasetName.mat in data/$DatasetName, where
$FeatureType = "unigram" or "bigram".
- data/$DatasetName/cv_obj.mat determines the standard evaluation for each dataset (how many
  folds, whats the split, etc.). They are generated by corresponding
  data processing script in src/misc

## Other implementations

Please consider submitting a pull request or shoot me an email if you used NBSVM in your work!

- https://github.com/mesnilgr/nbsvm, Python implementation by Grégoire Mesnil, It runs on the large IMDB dataset with a single script and the results are described in their [ICLR 2015 paper](http://arxiv.org/abs/1412.5335)
- https://github.com/dpressel/nbsvm-xl, Java implementation by Daniel Pressel, using SGD.
- https://github.com/lrei/nbsvm, Python implementation by Luis Rei, multiclass
- https://github.com/tkng/rakai, a Go implementation by tkng, probably imcomplete
- http://d.hatena.ne.jp/jetbead/20140916/1410798409, Perl! unfortunately cant read Japanese

It appears to be used in these kaggle entries:

- https://github.com/vinhkhuc/kaggle-sentiment-popcorn
- https://github.com/tjflexic/kaggle-word2vec-movie-reviews

## Notes
- The datasets are collected by others, please cite the original sources if you work with them
- The data structure used kept the order information of the document, instead of
converting to bag-of-words vector right away. This resulted in some
unnecessary mess for this work, but might make it easier if you want
to try a more complex model.


## Comments
- While many experiments have been ran for this task, performance is
  really all about regularization, and even the simplest model (Naive
  Bayes) would fit the training set perfectly. As far as I know, there is no good
  theory for why things even work in this case of non-sparse weights
  and p>>n.
- It is unclear if any of the complicated deep learning models
  today are doing significantly more than bag of words on these datasets:
  - As far as I know, none of these results are impressively better (usually about 1%)
  - Available compute power, engineering competence, and software infrastructure are vastly better for deep learning
  - Difference in enthusiasm level: no one seems to try very hard pushing basic models to the available compute power / hardware 
- Bag of words models run in few seconds or less, and
  behaves predictably for a different test distribution.
- It is very encouraging for me to see others finding this work helpful and implementing it. 
- Another [example](http://arxiv.org/abs/1512.02167) of bag of words going strong in 2015.


## References


For technical details see [our paper](wang12simple.pdf) and
[our talk](wang12simple_slides.pdf).

```
@inproceedings{wang12simple, 
author = {Wang, Sida I. and Manning, Christopher D.}, 
booktitle = {Proceedings of the ACL}, 
title = {Baselines and Bigrams: Simple, Good Sentiment and Topic Classification}, 
year = {2012}, 
booktitle = {ACL (2)}, 
pages = {90-94} 
} 
```

## IMDB comparisons

These works compare with the largest dataset of the batch (IMDB), where maybe regularization is not as important. Our result was 91.22% correct.

Quoc V. Le, Tomas Mikolov. Distributed Representations of Sentences and Documents. 2014.
- Got 92.58%, no released code, the paper below reports that the results were not reproduced.

Grégoire Mesnil, Tomas Mikolov, Marc'Aurelio Ranzato, Yoshua Bengio. Ensemble of Generative and Discriminative Techniques for Sentiment Analysis of Movie Reviews. ICLR 2015
- Their implementation of NBSVM actually got better than us at 91.87%, and their best number is 92.57% with some ensembling.

Andrew M. Dai, Quoc V. Le. Semi-supervised Sequence Learning. NIPS 2015.
- 92.76% with additional unlabeled data.

Stefan Wager, Sida Wang, and Percy Liang. Dropout Training as Adaptive Regularization. NIPS 2013
-  We got 91.98% using unlabeled data with logistic regression and bigrams.

(please submit a pull request if you want something added or changed)

MIT license: [here](LICENSE.MD)



