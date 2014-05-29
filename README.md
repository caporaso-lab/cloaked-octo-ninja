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
pick_closed_reference_otus.py -i <in> -o <out>/ucrC -p $PROJECT_DIR/parameters/ucrC.txt -r $REF_SEQS -aO 10
```

Subsampled open reference OTU picking (canonically abbreviated ucrss)
```
pick_open_reference_otus.py -i <in> -o <out>/ucrss -p $PROJECT_DIR/parameters/ucrss.txt -r $REF_SEQS -aO 10 --min_otu_size 1 --prefilter_percent_id 0.0
```

Subsampled open reference OTU picking (canonically abbreviated ucrss_w_filter)
```
pick_open_reference_otus.py -i <in> -o <out>/ucrss -p $PROJECT_DIR/parameters/ucrss.txt -r $REF_SEQS -aO 10 --min_otu_size 1
```

We also run these with the "fast uclust" settings.


To obtain the "tiny test" data set, which is useful for sanity checking commands, run:

```
python -c "from qiime.test import write_test_data; write_test_data('tiny-test')"
```

To run the four OTU picking protocols on the tiny-test data set, run:

```
source /home/caporaso/analysis/2014.04.16-ss-otus/config-env.sh; pick_de_novo_otus.py -i $TINY_TEST_SEQS -o $PROJECT_DIR/tiny-test-otus/uc -p $PROJECT_DIR/parameters/uc.txt -aO 10; pick_de_novo_otus.py -i $TINY_TEST_SEQS -o $PROJECT_DIR/tiny-test-otus/ucr -p $PROJECT_DIR/parameters/ucr.txt -aO 10; pick_closed_reference_otus.py -i $TINY_TEST_SEQS -o $PROJECT_DIR/tiny-test-otus/ucrC -p $PROJECT_DIR/parameters/ucrC.txt -r $REF_SEQS -aO 10; pick_open_reference_otus.py -i $TINY_TEST_SEQS -o $PROJECT_DIR/tiny-test-otus/ucrss -p $PROJECT_DIR/parameters/ucrss.txt -r $REF_SEQS -aO 10 --min_otu_size 1 --prefilter_percent_id 0.0
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

Input data sets
---------------

**Whole body**

```
count_seqs.py -i $WHOLE_BODY_SEQS

792831  : /home/caporaso/analysis/whole-body/study_449_split_library_seqs.fna (Sequence lengths (mean +/- std): 228.5124 +/- 16.0318)
```


**88 soils**

```
count_seqs.py -i $SOILS_SEQS

151387  : /home/caporaso/analysis/88-soils/study_103_split_library_seqs.fna (Sequence lengths (mean +/- std): 230.7818 +/- 11.4761)
```

**Moving Pictures**

```
count_seqs.py -i $MOVING_PICTURES_SEQS

68666081  : /home/caporaso/analysis/moving-pictures/study_550_split_library_seqs.fna (Sequence lengths (mean +/- std): 123.2359 +/- 17.4283)
```

Next steps
----------

See *OTU tables of interest...* list below for paths to the 30 OTU tables that need to be analyzed here.

 1. ~~Missing some trees, regenerate~~
 2. ~~Determine even sampling depths for all OTU tables and generate evenly sampled OTU tables (``biom summarize_table; single_rarefaction.py``).~~
 3. ~~Compute observed species and PD for all evenly sampled OTU tables (``alpha diversity.py -m observed_species,PD_whole_tree``).~~
 4. ~~Generate weighted and unweighted UniFrac distance matrices for all evenly sampled OTU tables (``beta_diversity.py`` - will require identifying the appropriate tree for all)~~ in progress
 5. ~~Determine relevant category for each data set, grouping existing data as necessary (e.g., bin the pH, L_palm/R_palm, skin sites) and compute significantly different OTUs across categories for all evenly sampled OTU tables (``group_significance.py``)~~
 6. ~~Confirm existence of all necessary data.~~
 7. Then generate the following tables:
  * table of run times for all runs above (by study) - **needs to be re-generated as some information is outdated due to failed OTU picking runs** [TABLE](https://docs.google.com/spreadsheets/d/1eVTVpV6cDj3yfRlVzd_zss_4WgxwDYrlfNmItdrRg9w/edit#gid=0)
  * ~~table of alpha diversity correlations for all pairwise comparisons of the above runs (by study)~~
  * table of compare_distance_matrices.py results (i.e., Mantel test) for all pairwise comparisons of the above runs (by study), mantel in progress
  * ~~table of top ten significant OTUs from group_significance.py for all pairwise comparisons of the above runs (by study)~~
 8. Table and plot of new OTUs by ENV_BIOME for the EMP run. [TABLE](https://docs.google.com/spreadsheet/ccc?key=0AhnFIU32uKRYdFd2T3hWdXA0bjc0RTUxR09aUkRuZUE&usp=sharing#gid=0)

```
l = [("moving-pictures-otus/uc/otu_table.biom", "moving-pictures-otus/uc/rep_set.tre", "pick_de_novo_otus.py -i $MOVING_PICTURES_SEQS -o $PROJECT_DIR/moving-pictures-otus/uc -p $PROJECT_DIR/parameters/uc.txt -aO 10", 5000),
("moving-pictures-otus/ucr/otu_table.biom", "moving-pictures-otus/ucr/rep_set.tre", "pick_de_novo_otus.py -i $MOVING_PICTURES_SEQS -o $PROJECT_DIR/moving-pictures-otus/ucr -p $PROJECT_DIR/parameters/ucr.txt -aO 10", 5000),
("moving-pictures-otus/ucrC/otu_table.biom", "$REF_TREE", "pick_closed_reference_otus.py -i $MOVING_PICTURES_SEQS -o $PROJECT_DIR/moving-pictures-otus/ucrC -p $PROJECT_DIR/parameters/ucrC.txt -r $REF_SEQS -aO 10 -t $REF_TAX", 5000),
("moving-pictures-otus/ucrss/otu_table_mc1_w_tax.biom", "moving-pictures-otus/ucrss/rep_set.tre", "pick_open_reference_otus.py -i $MOVING_PICTURES_SEQS -o $PROJECT_DIR/moving-pictures-otus/ucrss -p $PROJECT_DIR/parameters/ucrss.txt -r $REF_SEQS -aO 10 --min_otu_size 1 --prefilter_percent_id 0.0", 5000),
("moving-pictures-otus/ucrss_wfilter/otu_table_mc1_w_tax.biom", "moving-pictures-otus/ucrss_wfilter/rep_set.tre", "pick_open_reference_otus.py -i $MOVING_PICTURES_SEQS -o $PROJECT_DIR/moving-pictures-otus/ucrss_wfilter -p $PROJECT_DIR/parameters/ucrss.txt -r $REF_SEQS -aO 10 --min_otu_size 1", 5000),

("moving-pictures-otus/uc_fast/otu_table.biom", "moving-pictures-otus/uc_fast/rep_set.tre", "pick_de_novo_otus.py -i $MOVING_PICTURES_SEQS -o $PROJECT_DIR/moving-pictures-otus/uc_fast -p $PROJECT_DIR/parameters/uc_fast.txt -aO 10", 5000),
("moving-pictures-otus/ucr_fast/otu_table.biom", "moving-pictures-otus/ucr_fast/rep_set.tre", "pick_de_novo_otus.py -i $MOVING_PICTURES_SEQS -o $PROJECT_DIR/moving-pictures-otus/ucr_fast -p $PROJECT_DIR/parameters/ucr_fast.txt -aO 10", 5000),
("moving-pictures-otus/ucrC_fast/otu_table.biom", "$REF_TREE", "pick_closed_reference_otus.py -i $MOVING_PICTURES_SEQS -o $PROJECT_DIR/moving-pictures-otus/ucrC_fast -p $PROJECT_DIR/parameters/ucrC_fast.txt -r $REF_SEQS -aO 10 -t $REF_TAX", 5000),
("moving-pictures-otus/ucrss_fast/otu_table_mc1_w_tax.biom", "moving-pictures-otus/ucrss_fast/rep_set.tre", "pick_open_reference_otus.py -i $MOVING_PICTURES_SEQS -o $PROJECT_DIR/moving-pictures-otus/ucrss_fast -p $PROJECT_DIR/parameters/ucrss_fast.txt -r $REF_SEQS -aO 10 --min_otu_size 1 --prefilter_percent_id 0.0", 5000),
("moving-pictures-otus/ucrss_fast_wfilter/otu_table_mc1_w_tax.biom", "moving-pictures-otus/ucrss_fast_wfilter/rep_set.tre", "pick_open_reference_otus.py -i $MOVING_PICTURES_SEQS -o $PROJECT_DIR/moving-pictures-otus/ucrss_fast_wfilter -p $PROJECT_DIR/parameters/ucrss_fast.txt -r $REF_SEQS -aO 10 --min_otu_size 1", 5000),

("whole-body-otus/uc/otu_table.biom", "whole-body-otus/uc/rep_set.tre", "pick_de_novo_otus.py -i $WHOLE_BODY_SEQS -o $PROJECT_DIR/whole-body-otus/uc -p $PROJECT_DIR/parameters/uc.txt -aO 10", 700),
("whole-body-otus/ucr/otu_table.biom", "whole-body-otus/ucr/rep_set.tre", "pick_de_novo_otus.py -i $WHOLE_BODY_SEQS -o $PROJECT_DIR/whole-body-otus/ucr -p $PROJECT_DIR/parameters/ucr.txt -aO 10", 700),
("whole-body-otus/ucrC/otu_table.biom", "$REF_TREE", "pick_closed_reference_otus.py -i $WHOLE_BODY_SEQS -o $PROJECT_DIR/whole-body-otus/ucrC -p $PROJECT_DIR/parameters/ucrC.txt -r $REF_SEQS -aO 10 -t $REF_TAX", 700),
("whole-body-otus/ucrss/otu_table_mc1_w_tax.biom", "whole-body-otus/ucrss/rep_set.tre", "pick_open_reference_otus.py -i $WHOLE_BODY_SEQS -o $PROJECT_DIR/whole-body-otus/ucrss -p $PROJECT_DIR/parameters/ucrss.txt -r $REF_SEQS -aO 10  --min_otu_size 1 --prefilter_percent_id 0.0", 700),
("whole-body-otus/ucrss_wfilter/otu_table_mc1_w_tax.biom", "whole-body-otus/ucrss_wfilter/rep_set.tre", "pick_open_reference_otus.py -i $WHOLE_BODY_SEQS -o $PROJECT_DIR/whole-body-otus/ucrss_wfilter -p $PROJECT_DIR/parameters/ucrss.txt -r $REF_SEQS -aO 10 --min_otu_size 1", 700),

("whole-body-otus/uc_fast/otu_table.biom", "whole-body-otus/uc_fast/rep_set.tre", "pick_de_novo_otus.py -i $WHOLE_BODY_SEQS -o $PROJECT_DIR/whole-body-otus/uc_fast -p $PROJECT_DIR/parameters/uc_fast.txt -aO 10", 700),
("whole-body-otus/ucr_fast/otu_table.biom", "whole-body-otus/ucr_fast/rep_set.tre", "pick_de_novo_otus.py -i $WHOLE_BODY_SEQS -o $PROJECT_DIR/whole-body-otus/ucr_fast -p $PROJECT_DIR/parameters/ucr_fast.txt -aO 10", 700),
("whole-body-otus/ucrC_fast/otu_table.biom", "$REF_TREE", "pick_closed_reference_otus.py -i $WHOLE_BODY_SEQS -o $PROJECT_DIR/whole-body-otus/ucrC_fast -p $PROJECT_DIR/parameters/ucrC_fast.txt -r $REF_SEQS -aO 10 -t $REF_TAX", 700),
("whole-body-otus/ucrss_fast/otu_table_mc1_w_tax.biom", "whole-body-otus/ucrss_fast/rep_set.tre", "pick_open_reference_otus.py -i $WHOLE_BODY_SEQS -o $PROJECT_DIR/whole-body-otus/ucrss_fast -p $PROJECT_DIR/parameters/ucrss_fast.txt -r $REF_SEQS -aO 10  --min_otu_size 1 --prefilter_percent_id 0.0", 700),
("whole-body-otus/ucrss_fast_wfilter/otu_table_mc1_w_tax.biom", "whole-body-otus/ucrss_fast_wfilter/rep_set.tre", "pick_open_reference_otus.py -i $WHOLE_BODY_SEQS -o $PROJECT_DIR/whole-body-otus/ucrss_fast_wfilter -p $PROJECT_DIR/parameters/ucrss_fast.txt -r $REF_SEQS -aO 10 --min_otu_size 1", 700),

("88-soils-otus/uc/otu_table.biom", "88-soils-otus/uc/rep_set.tre", "pick_de_novo_otus.py -i $SOILS_SEQS -o $PROJECT_DIR/88-soils-otus/uc -p $PROJECT_DIR/parameters/uc.txt -aO 10", 400),
("88-soils-otus/ucr/otu_table.biom", "88-soils-otus/ucr/rep_set.tre", "pick_de_novo_otus.py -i $SOILS_SEQS -o $PROJECT_DIR/88-soils-otus/ucr -p $PROJECT_DIR/parameters/ucr.txt -aO 10", 400),
("88-soils-otus/ucrC/otu_table.biom", "$REF_TREE", "pick_closed_reference_otus.py -i $SOILS_SEQS -o $PROJECT_DIR/88-soils-otus/ucrC -p $PROJECT_DIR/parameters/ucrC.txt -r $REF_SEQS -aO 10 -t $REF_TAX", 400),
("88-soils-otus/ucrss/otu_table_mc1_w_tax.biom", "88-soils-otus/ucrss/rep_set.tre", "pick_open_reference_otus.py -i $SOILS_SEQS -o $PROJECT_DIR/88-soils-otus/ucrss -p $PROJECT_DIR/parameters/ucrss.txt -r $REF_SEQS -aO 10 --min_otu_size 1 --prefilter_percent_id 0.0", 400),
("88-soils-otus/ucrss_wfilter/otu_table_mc1_w_tax.biom", "88-soils-otus/ucrss_wfilter/rep_set.tre", "pick_open_reference_otus.py -i $SOILS_SEQS -o $PROJECT_DIR/88-soils-otus/ucrss_wfilter -p $PROJECT_DIR/parameters/ucrss.txt -r $REF_SEQS -aO 10 --min_otu_size 1", 400),

("88-soils-otus/uc_fast/otu_table.biom", "88-soils-otus/uc_fast/rep_set.tre", "pick_de_novo_otus.py -i $SOILS_SEQS -o $PROJECT_DIR/88-soils-otus/uc_fast -p $PROJECT_DIR/parameters/uc_fast.txt -aO 10", 400),
("88-soils-otus/ucr_fast/otu_table.biom", "88-soils-otus/ucr_fast/rep_set.tre", "pick_de_novo_otus.py -i $SOILS_SEQS -o $PROJECT_DIR/88-soils-otus/ucr_fast -p $PROJECT_DIR/parameters/ucr_fast.txt -aO 10", 400),
("88-soils-otus/ucrC_fast/otu_table.biom", "$REF_TREE", "pick_closed_reference_otus.py -i $SOILS_SEQS -o $PROJECT_DIR/88-soils-otus/ucrC_fast -p $PROJECT_DIR/parameters/ucrC_fast.txt -r $REF_SEQS -aO 10 -t $REF_TAX", 400),
("88-soils-otus/ucrss_fast/otu_table_mc1_w_tax.biom", "88-soils-otus/ucrss_fast/rep_set.tre", "pick_open_reference_otus.py -i $SOILS_SEQS -o $PROJECT_DIR/88-soils-otus/ucrss_fast -p $PROJECT_DIR/parameters/ucrss_fast.txt -r $REF_SEQS -aO 10 --min_otu_size 1 --prefilter_percent_id 0.0", 400),
("88-soils-otus/ucrss_fast_wfilter/otu_table_mc1_w_tax.biom", "88-soils-otus/ucrss_fast_wfilter/rep_set.tre", "pick_open_reference_otus.py -i $SOILS_SEQS -o $PROJECT_DIR/88-soils-otus/ucrss_fast_wfilter -p $PROJECT_DIR/parameters/ucrss_fast.txt -r $REF_SEQS -aO 10 --min_otu_size 1", 400)]

# generate BIOM table summaries
for e in l:
    biom_fp = e[0]
    summ_fp = biom_fp.replace('.biom', '_summ.txt')
    cmd = "biom summarize-table -i %s -o %s" % (biom_fp, summ_fp)
    !$cmd

# generate rarified otu tables
for e in l:
    in_fp = e[0]
    d = e[3]
    out_fp = e[0].replace('.biom', '_even%d.biom' % d)
    cmd = 'echo "cd /home/caporaso/analysis/2014.04.16-ss-otus ; single_rarefaction.py -i %s -o %s -d %d" | qsub -keo -N sr' % (in_fp, out_fp, d)
    !$cmd

# run alpha diversity and beta diversity
for e in l:
    full_otu_table_fp = e[0]
    tree_fp = e[1]
    d = e[3]
    in_fp = full_otu_table_fp.replace('.biom', '_even%d.biom' % d)
    input_dir = split(full_otu_table_fp)[0]
    alpha_out_fp = join(input_dir,'adiv_even%d.txt' % d)
    beta_out_dir = join(input_dir,'bdiv_even%d' % d)
    alpha_cmd = 'cd /home/caporaso/analysis/2014.04.16-ss-otus; source config-env.sh ; echo "cd /home/caporaso/analysis/2014.04.16-ss-otus ; source config-env.sh ; alpha_diversity.py -i %s -o %s -m observed_species,PD_whole_tree -t %s" | qsub -keo -N adiv' % (in_fp, alpha_out_fp, tree_fp)
    beta_cmd = 'cd /home/caporaso/analysis/2014.04.16-ss-otus; source config-env.sh ; echo "cd /home/caporaso/analysis/2014.04.16-ss-otus ; source config-env.sh ; beta_diversity.py -i %s -o %s -t %s" | qsub -keo -N bdiv' % (in_fp, beta_out_dir, tree_fp)
    !$alpha_cmd
    !$beta_cmd

# run group significance (moving pictures)
for e in l[:10]:
    full_otu_table_fp = e[0]
    d = e[3]
    in_fp = full_otu_table_fp.replace('.biom', '_even%d.biom' % d)
    input_dir = split(full_otu_table_fp)[0]
    out_fp = join(input_dir,'group_significance_even%d.txt' % d)
    group_sig_cmd = "cd /home/caporaso/analysis/2014.04.16-ss-otus ; source config-env.sh ; group_significance.py -i %s -m %s -o %s -c %s" % (in_fp, "$MOVING_PICTURES_MAP", out_fp, "BODY_SITE")
    cmd = 'cd /home/caporaso/analysis/2014.04.16-ss-otus ; source config-env.sh ; echo "%s" | qsub -keo -N gs' % group_sig_cmd
    !$cmd

# run group significance (whole body)
for e in l[10:20]:
    full_otu_table_fp = e[0]
    d = e[3]
    in_fp = full_otu_table_fp.replace('.biom', '_even%d.biom' % d)
    input_dir = split(full_otu_table_fp)[0]
    out_fp = join(input_dir,'group_significance_even%d.txt' % d)
    group_sig_cmd = "cd /home/caporaso/analysis/2014.04.16-ss-otus ; source config-env.sh ; group_significance.py -i %s -m %s -o %s -c %s" % (in_fp, "$WHOLE_BODY_MAP", out_fp, 'body_habitat_basic')
    cmd = 'cd /home/caporaso/analysis/2014.04.16-ss-otus ; source config-env.sh ; echo "%s" | qsub -keo -N gs' % group_sig_cmd
    !$cmd

# run group significance (88-soils)
for e in l[20:]:
    full_otu_table_fp = e[0]
    d = e[3]
    in_fp = full_otu_table_fp.replace('.biom', '_even%d.biom' % d)
    input_dir = split(full_otu_table_fp)[0]
    out_fp = join(input_dir,'group_significance_even%d.txt' % d)
    group_sig_cmd = "cd /home/caporaso/analysis/2014.04.16-ss-otus ; source config-env.sh ; group_significance.py -i %s -m %s -o %s -c %s" % (in_fp, "$SOILS_MAP", out_fp, "ph_bin")
    cmd = 'cd /home/caporaso/analysis/2014.04.16-ss-otus ; source config-env.sh ; echo "%s" | qsub -keo -N gs' % group_sig_cmd
    !$cmd


# run mantel tests
def get_unifrac_dm_fp(e, metric_name):
    full_otu_table_fp = e[0]
    d = e[3]
    in_fp = full_otu_table_fp.replace('.biom', '_even%d.biom' % d)
    bdiv_dir = join(split(full_otu_table_fp)[0], 'bdiv_even%d' % d)
    dm_fp = ''.join([metric_name, '_',
                     splitext(split(in_fp)[1])[0],
                     '.txt'])
    return join(bdiv_dir,dm_fp)

datasets = [('moving-pictures-otus', range(10)),
            ('whole-body-otus', range(10,20)),
            ('88-soils-otus',range(20,30))]
for metric in ['unweighted_unifrac', 'weighted_unifrac']:
    for otu_dir, data_range in datasets:
        dm_fps = \
            [get_unifrac_dm_fp(l[i], metric) for i in data_range]
        mantel_fp = join(
            otu_dir, '%s_mantel_results.txt' % metric)
        cmp_cmd = 'compare_distance_matrices.py -i %s -o %s --method mantel -n 999' %\
            (','.join(dm_fps), mantel_fp)
        cmd = 'echo "cd /home/caporaso/analysis/2014.04.16-ss-otus ; source config-env.sh ; %s" | qsub -keo -N cmp_dist' % cmp_cmd
        !$cmd

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
