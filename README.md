cloaked-octo-ninja: Comparative analysis of high-level OTU picking protocols
============================================================================

To configure the environment, you can run:
```
source config-env.sh
```

To obtain the "tiny test" data set, run:

```
python -c "from qiime.test import write_test_data; write_test_data('tiny-test')"
```

To run the four OTU picking protocols on the tiny-test data set, run:

```
source /home/caporaso/analysis/2014.04.16-ss-otus/config-env.sh;
pick_de_novo_otus.py -i $TINY_TEST_SEQS -o $PROJECT_DIR/tiny-test-otus/uc -p
$PROJECT_DIR/parameters/uc.txt -aO 10; pick_de_novo_otus.py -i $TINY_TEST_SEQS
-o $PROJECT_DIR/tiny-test-otus/ucr -p $PROJECT_DIR/parameters/ucr.txt -aO 10;
pick_closed_reference_otus.py -i $TINY_TEST_SEQS -o
$PROJECT_DIR/tiny-test-otus/ucrC -p $PROJECT_DIR/parameters/ucr.txt -r
$REF_SEQS -aO 10; pick_open_reference_otus.py -i $TINY_TEST_SEQS -o
$PROJECT_DIR/tiny-test-otus/ucrss -p $PROJECT_DIR/parameters/ucrss.txt -r
$REF_SEQS -aO 10
```

This command is of the form:

```
pick_de_novo_otus.py -i <in> -o <out>/uc -p $PROJECT_DIR/parameters/uc.txt -aO
10; pick_de_novo_otus.py -i <in> -o <out>/ucr -p
$PROJECT_DIR/parameters/ucr.txt -aO 10; pick_closed_reference_otus.py -i <in>
-o <out>/ucrC -p $PROJECT_DIR/parameters/ucr.txt -r $REF_SEQS -aO 10;
pick_open_reference_otus.py -i <in> -o <out>/ucrss -p
$PROJECT_DIR/parameters/ucrss.txt -r $REF_SEQS -aO 10
```
