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

We can then obtain run-time information as follows:

```
$ cd $PROJECT_DIR
caporaso@bacon 11:02:11 2014.04.16-ss-otus@master$ grep "^Logging" tiny-test-otus/*/log*txt
tiny-test-otus/uc/log_20140416105426.txt:Logging started at 10:54:26 on 16 Apr 2014
tiny-test-otus/uc/log_20140416105426.txt:Logging stopped at 10:55:05 on 16 Apr 2014
tiny-test-otus/ucrC/log_20140416105545.txt:Logging started at 10:55:45 on 16 Apr 2014
tiny-test-otus/ucrC/log_20140416105545.txt:Logging stopped at 10:57:00 on 16 Apr 2014
tiny-test-otus/ucr/log_20140416105506.txt:Logging started at 10:55:06 on 16 Apr 2014
tiny-test-otus/ucr/log_20140416105506.txt:Logging stopped at 10:55:45 on 16 Apr 2014
tiny-test-otus/ucrss/log_20140416105700.txt:Logging started at 10:57:00 on 16 Apr 2014
tiny-test-otus/ucrss/log_20140416105700.txt:Logging stopped at 10:59:53 on 16 Apr 2014
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

Whole body
```
echo "source /home/caporaso/analysis/2014.04.16-ss-otus/config-env.sh;
pick_de_novo_otus.py -i $WHOLE_BODY_SEQS -o $PROJECT_DIR/whole-body-otus/uc -p
$PROJECT_DIR/parameters/uc.txt -aO 10; pick_de_novo_otus.py -i $WHOLE_BODY_SEQS
-o $PROJECT_DIR/whole-body-otus/ucr -p $PROJECT_DIR/parameters/ucr.txt -aO 10;
pick_closed_reference_otus.py -i $WHOLE_BODY_SEQS -o
$PROJECT_DIR/whole-body-otus/ucrC -p $PROJECT_DIR/parameters/ucr.txt -r
$REF_SEQS -aO 10; pick_open_reference_otus.py -i $WHOLE_BODY_SEQS -o
$PROJECT_DIR/whole-body-otus/ucrss -p $PROJECT_DIR/parameters/ucrss.txt -r
$REF_SEQS -aO 10" | qsub -keo -N otus-wb
```

Moving Pictures

```
echo "source /home/caporaso/analysis/2014.04.16-ss-otus/config-env.sh;
pick_de_novo_otus.py -i $MOVING_PICTURES_SEQS -o
$PROJECT_DIR/moving-pictures-otus/uc -p $PROJECT_DIR/parameters/uc.txt -aO 10;
pick_de_novo_otus.py -i $MOVING_PICTURES_SEQS -o
$PROJECT_DIR/moving-pictures-otus/ucr -p $PROJECT_DIR/parameters/ucr.txt -aO
10; pick_closed_reference_otus.py -i $MOVING_PICTURES_SEQS -o
$PROJECT_DIR/moving-pictures-otus/ucrC -p $PROJECT_DIR/parameters/ucr.txt -r
$REF_SEQS -aO 10; pick_open_reference_otus.py -i $MOVING_PICTURES_SEQS -o
$PROJECT_DIR/moving-pictures-otus/ucrss -p $PROJECT_DIR/parameters/ucrss.txt -r
$REF_SEQS -aO 10" | qsub -keo -N mpotus
```

88 soils

```
echo "source /home/caporaso/analysis/2014.04.16-ss-otus/config-env.sh;
pick_de_novo_otus.py -i $SOILS_SEQS -o $PROJECT_DIR/88-soils-otus/uc -p
$PROJECT_DIR/parameters/uc.txt -aO 10; pick_de_novo_otus.py -i $SOILS_SEQS -o
$PROJECT_DIR/88-soils-otus/ucr -p $PROJECT_DIR/parameters/ucr.txt -aO 10;
pick_closed_reference_otus.py -i $SOILS_SEQS -o $PROJECT_DIR/88-soils-otus/ucrC
-p $PROJECT_DIR/parameters/ucr.txt -r $REF_SEQS -aO 10;
pick_open_reference_otus.py -i $SOILS_SEQS -o $PROJECT_DIR/88-soils-otus/ucrss
-p $PROJECT_DIR/parameters/ucrss.txt -r $REF_SEQS -aO 10" | qsub -keo -N
soilotus
```
