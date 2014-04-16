Comparative analysis of high-level OTU picking protocols
========================================================

Configuring and testing the environment
---------------------------------------

To configure the environment, you can run:
```
source config-env.sh
```

The OTU picking commands that we're interested in are as follows:

*De novo* OTU picking (canonically abbreviated uc)
```
pick_de_novo_otus.py -i <in> -o <out>/uc -p $PROJECT_DIR/parameters/uc.txt -aO 10
```

"Legacy" open reference OTU picking (canonically abbreviated ucr)
```
pick_de_novo_otus.py -i <in> -o <out>/ucr -p $PROJECT_DIR/parameters/ucr.txt -aO 10
```

Closed reference OTU picking (canonically abbreviated ucrC)
```
pick_closed_reference_otus.py -i <in> -o <out>/ucrC -p $PROJECT_DIR/parameters/ucr.txt -r $REF_SEQS -aO 10
```

Subsampled open reference OTU picking (canonically abbreviated ucrss)
```
pick_open_reference_otus.py -i <in> -o <out>/ucrss -p $PROJECT_DIR/parameters/ucrss.txt -r $REF_SEQS -aO 10 --min_otu_size 1 --prefilter_percent_id 0.0
```


To obtain the "tiny test" data set, which is useful for sanity checking commands, run:

```
python -c "from qiime.test import write_test_data; write_test_data('tiny-test')"
```

To run the four OTU picking protocols on the tiny-test data set, run:

```
source /home/caporaso/analysis/2014.04.16-ss-otus/config-env.sh; pick_de_novo_otus.py -i $TINY_TEST_SEQS -o $PROJECT_DIR/tiny-test-otus/uc -p $PROJECT_DIR/parameters/uc.txt -aO 10; pick_de_novo_otus.py -i $TINY_TEST_SEQS -o $PROJECT_DIR/tiny-test-otus/ucr -p $PROJECT_DIR/parameters/ucr.txt -aO 10; pick_closed_reference_otus.py -i $TINY_TEST_SEQS -o $PROJECT_DIR/tiny-test-otus/ucrC -p $PROJECT_DIR/parameters/ucr.txt -r $REF_SEQS -aO 10; pick_open_reference_otus.py -i $TINY_TEST_SEQS -o $PROJECT_DIR/tiny-test-otus/ucrss -p $PROJECT_DIR/parameters/ucrss.txt -r $REF_SEQS -aO 10 --min_otu_size 1 --prefilter_percent_id 0.0
```

We can then obtain run-time information as follows:

```
$ cd $PROJECT_DIR
$ grep "^Logging" tiny-test-otus/*/log*txt
tiny-test-otus/uc/log_20140416144749.txt:Logging started at 14:47:49 on 16 Apr 2014
tiny-test-otus/uc/log_20140416144749.txt:Logging stopped at 14:48:25 on 16 Apr 2014
tiny-test-otus/ucrC/log_20140416144900.txt:Logging started at 14:49:00 on 16 Apr 2014
tiny-test-otus/ucrC/log_20140416144900.txt:Logging stopped at 14:50:14 on 16 Apr 2014
tiny-test-otus/ucr/log_20140416144825.txt:Logging started at 14:48:25 on 16 Apr 2014
tiny-test-otus/ucr/log_20140416144825.txt:Logging stopped at 14:49:00 on 16 Apr 2014
tiny-test-otus/ucrss/log_20140416145014.txt:Logging started at 14:50:14 on 16 Apr 2014
tiny-test-otus/ucrss/log_20140416145014.txt:Logging stopped at 14:52:01 on 16 Apr 2014
```

Application to three data sets
------------------------------


**Whole body**

```
echo "source /home/caporaso/analysis/2014.04.16-ss-otus/config-env.sh; pick_de_novo_otus.py -i $WHOLE_BODY_SEQS -o $PROJECT_DIR/whole-body-otus/uc -p $PROJECT_DIR/parameters/uc.txt -aO 10; pick_de_novo_otus.py -i $WHOLE_BODY_SEQS -o $PROJECT_DIR/whole-body-otus/ucr -p $PROJECT_DIR/parameters/ucr.txt -aO 10; pick_closed_reference_otus.py -i $WHOLE_BODY_SEQS -o $PROJECT_DIR/whole-body-otus/ucrC -p $PROJECT_DIR/parameters/ucr.txt -r $REF_SEQS -aO 10; pick_open_reference_otus.py -i $WHOLE_BODY_SEQS -o $PROJECT_DIR/whole-body-otus/ucrss -p $PROJECT_DIR/parameters/ucrss.txt -r $REF_SEQS -aO 10  --min_otu_size 1 --prefilter_percent_id 0.0" | qsub -keo -N otus-wb
```

```
$ grep "^Logging" whole-body-otus/*/log*txt

```

**88 soils**

```
echo "source /home/caporaso/analysis/2014.04.16-ss-otus/config-env.sh; pick_de_novo_otus.py -i $SOILS_SEQS -o $PROJECT_DIR/88-soils-otus/uc -p $PROJECT_DIR/parameters/uc.txt -aO 10; pick_de_novo_otus.py -i $SOILS_SEQS -o $PROJECT_DIR/88-soils-otus/ucr -p $PROJECT_DIR/parameters/ucr.txt -aO 10; pick_closed_reference_otus.py -i $SOILS_SEQS -o $PROJECT_DIR/88-soils-otus/ucrC -p $PROJECT_DIR/parameters/ucr.txt -r $REF_SEQS -aO 10; pick_open_reference_otus.py -i $SOILS_SEQS -o $PROJECT_DIR/88-soils-otus/ucrss -p $PROJECT_DIR/parameters/ucrss.txt -r $REF_SEQS -aO 10 --min_otu_size 1 --prefilter_percent_id 0.0" | qsub -keo -N soilotus
```

```
$ grep "^Logging" 88-soils-otus/*/log*txt

```


**Moving Pictures**

```
echo "source /home/caporaso/analysis/2014.04.16-ss-otus/config-env.sh; pick_de_novo_otus.py -i $MOVING_PICTURES_SEQS -o $PROJECT_DIR/moving-pictures-otus/uc -p $PROJECT_DIR/parameters/uc.txt -aO 10; pick_de_novo_otus.py -i $MOVING_PICTURES_SEQS -o $PROJECT_DIR/moving-pictures-otus/ucr -p $PROJECT_DIR/parameters/ucr.txt -aO 10; pick_closed_reference_otus.py -i $MOVING_PICTURES_SEQS -o $PROJECT_DIR/moving-pictures-otus/ucrC -p $PROJECT_DIR/parameters/ucr.txt -r $REF_SEQS -aO 10; pick_open_reference_otus.py -i $MOVING_PICTURES_SEQS -o $PROJECT_DIR/moving-pictures-otus/ucrss -p $PROJECT_DIR/parameters/ucrss.txt -r $REF_SEQS -aO 10 --min_otu_size 1 --prefilter_percent_id 0.0" | qsub -keo -N mpotus
```

```
$ grep "^Logging" moving-pictures-otus/*/log*txt

```


QIIME config information
------------------------

```
$ print_qiime_config.py

System information
==================
         Platform:	linux2
   Python version:	2.7.3 (default, May  3 2013, 07:17:12)  [GCC 4.4.7 20120313 (Red Hat 4.4.7-3)]
Python executable:	/data/qiime_software/python-2.7.3-release/bin/python

Dependency versions
===================
                     PyCogent version:	1.5.3
                        NumPy version:	1.7.1
                        SciPy version:	0.13.3
                   matplotlib version:	1.3.1
                  biom-format version:	1.3.1
                         qcli version:	0.1.0
                         pyqi version:	0.3.1
                   scikit-bio version:	0.0.0-dev
                QIIME library version:	1.8.0-dev, master@3a5ac1d
                 QIIME script version:	1.8.0-dev
        PyNAST version (if installed):	1.2.2
                      Emperor version:	0.9.3
RDP Classifier version (if installed):	rdp_classifier-2.2.jar
          Java version (if installed):	1.6.0_24

QIIME config values
===================
                     blastmat_dir:	/data/qiime_software/blast-2.2.22-release/data
                    python_exe_fp:	/data/qiime_software/python-2.7.3-release/bin/python
                         sc_queue:	all.q
   template_alignment_lanemask_fp:	/data/lanemask_in_1s_and_0s
     pynast_template_alignment_fp:	/data/core_set_aligned.fasta.imputed
                      working_dir:	/tmp/
                 seconds_to_sleep:	1
pynast_template_alignment_blastdb:	None
assign_taxonomy_reference_seqs_fp:	/data/gg_13_8_otus/rep_set/97_otus.fasta
                     torque_queue:	friendlyq
      topiaryexplorer_project_dir:	None
                    jobs_to_start:	1
                cloud_environment:	False
                qiime_scripts_dir:	/data/qiime_software/qiime-1.8.0-repository-779803b3/bin
            denoiser_min_per_core:	50
                  cluster_jobs_fp:	start_parallel_jobs_torque.py
assign_taxonomy_id_to_taxonomy_fp:	/data/gg_13_8_otus/taxonomy/97_otu_taxonomy.txt
                         temp_dir:	/home/caporaso/temp/
                      blastall_fp:	/data/qiime_software/blast-2.2.22-release/bin/blastall
```
