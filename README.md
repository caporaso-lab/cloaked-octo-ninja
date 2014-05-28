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
 5. ~~Determine relevant category for each data set, grouping existing data as necessary (e.g., bin the pH, L_palm/R_palm, skin sites) and compute significantly different OTUs across categories for all evenly sampled OTU tables (``group_significance.py``)~~ in progress
 6. Confirm existence of all necessary data.
 7. Then generate the following tables:
  * table of run times for all runs above (by study) - **needs to be re-generated as some information is outdated due to failed OTU picking runs** [TABLE](https://docs.google.com/spreadsheets/d/1eVTVpV6cDj3yfRlVzd_zss_4WgxwDYrlfNmItdrRg9w/edit#gid=0)
  * table of compare_alpha_diversity.py results for all pairwise comparisons of the above runs (by study)
  * table of compare_distance_matrices.py results (i.e., Mantel test) for all pairwise comparisons of the above runs (by study)
  * table of top ten significant OTUs from group_significance.py for all pairwise comparisons of the above runs (by study)
 8. Table and plot of new OTUs by ENV_BIOME for the EMP run. [TABLE](https://docs.google.com/spreadsheet/ccc?key=0AhnFIU32uKRYdFd2T3hWdXA0bjc0RTUxR09aUkRuZUE&usp=sharing#gid=0)

```
l = [("moving-pictures-otus/uc/otu_table.biom", "moving-pictures-otus/uc/rep_set.tre", "pick_de_novo_otus.py -i $MOVING_PICTURES_SEQS -o $PROJECT_DIR/moving-pictures-otus/uc -p $PROJECT_DIR/parameters/uc.txt -aO 10", 5000),
("moving-pictures-otus/ucr/otu_table.biom", "moving-pictures-otus/ucr/rep_set.tre", "pick_de_novo_otus.py -i $MOVING_PICTURES_SEQS -o $PROJECT_DIR/moving-pictures-otus/ucr -p $PROJECT_DIR/parameters/ucr.txt -aO 10", 5000),
("moving-pictures-otus/ucrC/otu_table.biom", "$REF_TREE", "pick_closed_reference_otus.py -i $MOVING_PICTURES_SEQS -o $PROJECT_DIR/moving-pictures-otus/ucrC -p $PROJECT_DIR/parameters/ucrC.txt -r $REF_SEQS -aO 10", 5000),
("moving-pictures-otus/ucrss/otu_table_mc1_w_tax.biom", "moving-pictures-otus/ucrss/rep_set.tre", "pick_open_reference_otus.py -i $MOVING_PICTURES_SEQS -o $PROJECT_DIR/moving-pictures-otus/ucrss -p $PROJECT_DIR/parameters/ucrss.txt -r $REF_SEQS -aO 10 --min_otu_size 1 --prefilter_percent_id 0.0", 5000),
("moving-pictures-otus/ucrss_wfilter/otu_table_mc1_w_tax.biom", "moving-pictures-otus/ucrss_wfilter/rep_set.tre", "pick_open_reference_otus.py -i $MOVING_PICTURES_SEQS -o $PROJECT_DIR/moving-pictures-otus/ucrss_wfilter -p $PROJECT_DIR/parameters/ucrss.txt -r $REF_SEQS -aO 10 --min_otu_size 1", 5000),

("moving-pictures-otus/uc_fast/otu_table.biom", "moving-pictures-otus/uc_fast/rep_set.tre", "pick_de_novo_otus.py -i $MOVING_PICTURES_SEQS -o $PROJECT_DIR/moving-pictures-otus/uc_fast -p $PROJECT_DIR/parameters/uc_fast.txt -aO 10", 5000),
("moving-pictures-otus/ucr_fast/otu_table.biom", "moving-pictures-otus/ucr_fast/rep_set.tre", "pick_de_novo_otus.py -i $MOVING_PICTURES_SEQS -o $PROJECT_DIR/moving-pictures-otus/ucr_fast -p $PROJECT_DIR/parameters/ucr_fast.txt -aO 10", 5000),
("moving-pictures-otus/ucrC_fast/otu_table.biom", "$REF_TREE", "pick_closed_reference_otus.py -i $MOVING_PICTURES_SEQS -o $PROJECT_DIR/moving-pictures-otus/ucrC_fast -p $PROJECT_DIR/parameters/ucrC_fast.txt -r $REF_SEQS -aO 10", 5000),
("moving-pictures-otus/ucrss_fast/otu_table_mc1_w_tax.biom", "moving-pictures-otus/ucrss_fast/rep_set.tre", "pick_open_reference_otus.py -i $MOVING_PICTURES_SEQS -o $PROJECT_DIR/moving-pictures-otus/ucrss_fast -p $PROJECT_DIR/parameters/ucrss_fast.txt -r $REF_SEQS -aO 10 --min_otu_size 1 --prefilter_percent_id 0.0", 5000),
("moving-pictures-otus/ucrss_fast_wfilter/otu_table_mc1_w_tax.biom", "moving-pictures-otus/ucrss_fast_wfilter/rep_set.tre", "pick_open_reference_otus.py -i $MOVING_PICTURES_SEQS -o $PROJECT_DIR/moving-pictures-otus/ucrss_fast_wfilter -p $PROJECT_DIR/parameters/ucrss_fast.txt -r $REF_SEQS -aO 10 --min_otu_size 1", 5000),

("whole-body-otus/uc/otu_table.biom", "whole-body-otus/uc/rep_set.tre", "pick_de_novo_otus.py -i $WHOLE_BODY_SEQS -o $PROJECT_DIR/whole-body-otus/uc -p $PROJECT_DIR/parameters/uc.txt -aO 10", 700),
("whole-body-otus/ucr/otu_table.biom", "whole-body-otus/ucr/rep_set.tre", "pick_de_novo_otus.py -i $WHOLE_BODY_SEQS -o $PROJECT_DIR/whole-body-otus/ucr -p $PROJECT_DIR/parameters/ucr.txt -aO 10", 700),
("whole-body-otus/ucrC/otu_table.biom", "$REF_TREE", "pick_closed_reference_otus.py -i $WHOLE_BODY_SEQS -o $PROJECT_DIR/whole-body-otus/ucrC -p $PROJECT_DIR/parameters/ucrC.txt -r $REF_SEQS -aO 10", 700),
("whole-body-otus/ucrss/otu_table_mc1_w_tax.biom", "whole-body-otus/ucrss/rep_set.tre", "pick_open_reference_otus.py -i $WHOLE_BODY_SEQS -o $PROJECT_DIR/whole-body-otus/ucrss -p $PROJECT_DIR/parameters/ucrss.txt -r $REF_SEQS -aO 10  --min_otu_size 1 --prefilter_percent_id 0.0", 700),
("whole-body-otus/ucrss_wfilter/otu_table_mc1_w_tax.biom", "whole-body-otus/ucrss_wfilter/rep_set.tre", "pick_open_reference_otus.py -i $WHOLE_BODY_SEQS -o $PROJECT_DIR/whole-body-otus/ucrss_wfilter -p $PROJECT_DIR/parameters/ucrss.txt -r $REF_SEQS -aO 10 --min_otu_size 1", 700),

("whole-body-otus/uc_fast/otu_table.biom", "whole-body-otus/uc_fast/rep_set.tre", "pick_de_novo_otus.py -i $WHOLE_BODY_SEQS -o $PROJECT_DIR/whole-body-otus/uc_fast -p $PROJECT_DIR/parameters/uc_fast.txt -aO 10", 700),
("whole-body-otus/ucr_fast/otu_table.biom", "whole-body-otus/ucr_fast/rep_set.tre", "pick_de_novo_otus.py -i $WHOLE_BODY_SEQS -o $PROJECT_DIR/whole-body-otus/ucr_fast -p $PROJECT_DIR/parameters/ucr_fast.txt -aO 10", 700),
("whole-body-otus/ucrC_fast/otu_table.biom", "$REF_TREE", "pick_closed_reference_otus.py -i $WHOLE_BODY_SEQS -o $PROJECT_DIR/whole-body-otus/ucrC_fast -p $PROJECT_DIR/parameters/ucrC_fast.txt -r $REF_SEQS -aO 10", 700),
("whole-body-otus/ucrss_fast/otu_table_mc1_w_tax.biom", "whole-body-otus/ucrss_fast/rep_set.tre", "pick_open_reference_otus.py -i $WHOLE_BODY_SEQS -o $PROJECT_DIR/whole-body-otus/ucrss_fast -p $PROJECT_DIR/parameters/ucrss_fast.txt -r $REF_SEQS -aO 10  --min_otu_size 1 --prefilter_percent_id 0.0", 700),
("whole-body-otus/ucrss_fast_wfilter/otu_table_mc1_w_tax.biom", "whole-body-otus/ucrss_fast_wfilter/rep_set.tre", "pick_open_reference_otus.py -i $WHOLE_BODY_SEQS -o $PROJECT_DIR/whole-body-otus/ucrss_fast_wfilter -p $PROJECT_DIR/parameters/ucrss_fast.txt -r $REF_SEQS -aO 10 --min_otu_size 1", 700),

("88-soils-otus/uc/otu_table.biom", "88-soils-otus/uc/rep_set.tre", "pick_de_novo_otus.py -i $SOILS_SEQS -o $PROJECT_DIR/88-soils-otus/uc -p $PROJECT_DIR/parameters/uc.txt -aO 10", 400),
("88-soils-otus/ucr/otu_table.biom", "88-soils-otus/ucr/rep_set.tre", "pick_de_novo_otus.py -i $SOILS_SEQS -o $PROJECT_DIR/88-soils-otus/ucr -p $PROJECT_DIR/parameters/ucr.txt -aO 10", 400),
("88-soils-otus/ucrC/otu_table.biom", "$REF_TREE", "pick_closed_reference_otus.py -i $SOILS_SEQS -o $PROJECT_DIR/88-soils-otus/ucrC -p $PROJECT_DIR/parameters/ucrC.txt -r $REF_SEQS -aO 10", 400),
("88-soils-otus/ucrss/otu_table_mc1_w_tax.biom", "88-soils-otus/ucrss/rep_set.tre", "pick_open_reference_otus.py -i $SOILS_SEQS -o $PROJECT_DIR/88-soils-otus/ucrss -p $PROJECT_DIR/parameters/ucrss.txt -r $REF_SEQS -aO 10 --min_otu_size 1 --prefilter_percent_id 0.0", 400),
("88-soils-otus/ucrss_wfilter/otu_table_mc1_w_tax.biom", "88-soils-otus/ucrss_wfilter/rep_set.tre", "pick_open_reference_otus.py -i $SOILS_SEQS -o $PROJECT_DIR/88-soils-otus/ucrss_wfilter -p $PROJECT_DIR/parameters/ucrss.txt -r $REF_SEQS -aO 10 --min_otu_size 1", 400),

("88-soils-otus/uc_fast/otu_table.biom", "88-soils-otus/uc_fast/rep_set.tre", "pick_de_novo_otus.py -i $SOILS_SEQS -o $PROJECT_DIR/88-soils-otus/uc_fast -p $PROJECT_DIR/parameters/uc_fast.txt -aO 10", 400),
("88-soils-otus/ucr_fast/otu_table.biom", "88-soils-otus/ucr_fast/rep_set.tre", "pick_de_novo_otus.py -i $SOILS_SEQS -o $PROJECT_DIR/88-soils-otus/ucr_fast -p $PROJECT_DIR/parameters/ucr_fast.txt -aO 10", 400),
("88-soils-otus/ucrC_fast/otu_table.biom", "$REF_TREE", "pick_closed_reference_otus.py -i $SOILS_SEQS -o $PROJECT_DIR/88-soils-otus/ucrC_fast -p $PROJECT_DIR/parameters/ucrC_fast.txt -r $REF_SEQS -aO 10", 400),
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
    alpha_cmd = 'echo "cd /home/caporaso/analysis/2014.04.16-ss-otus ; alpha_diversity.py -i %s -o %s -m observed_species,PD_whole_tree -t %s" | qsub -keo -N adiv' % (in_fp, alpha_out_fp, tree_fp)
    beta_cmd = 'echo "cd /home/caporaso/analysis/2014.04.16-ss-otus ; beta_diversity.py -i %s -o %s -t %s" | qsub -keo -N bdiv' % (in_fp, beta_out_dir, tree_fp)
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
    cmd = 'echo "%s" | qsub -keo -N gs' % group_sig_cmd
    !$cmd

# run group significance (whole body)
for e in l[10:20]:
    full_otu_table_fp = e[0]
    d = e[3]
    in_fp = full_otu_table_fp.replace('.biom', '_even%d.biom' % d)
    input_dir = split(full_otu_table_fp)[0]
    out_fp = join(input_dir,'group_significance_even%d.txt' % d)
    group_sig_cmd = "cd /home/caporaso/analysis/2014.04.16-ss-otus ; source config-env.sh ; group_significance.py -i %s -m %s -o %s -c %s" % (in_fp, "$WHOLE_BODY_MAP", out_fp, 'body_habitat_basic')
    cmd = 'echo "%s" | qsub -keo -N gs' % group_sig_cmd
    !$cmd

# run group significance (88-soils)
for e in l[20:]:
    full_otu_table_fp = e[0]
    d = e[3]
    in_fp = full_otu_table_fp.replace('.biom', '_even%d.biom' % d)
    input_dir = split(full_otu_table_fp)[0]
    out_fp = join(input_dir,'group_significance_even%d.txt' % d)
    group_sig_cmd = "cd /home/caporaso/analysis/2014.04.16-ss-otus ; source config-env.sh ; group_significance.py -i %s -m %s -o %s -c %s" % (in_fp, "$SOILS_MAP", out_fp, "ph_bin")
    cmd = 'echo "%s" | qsub -keo -N gs' % group_sig_cmd
    !$cmd


    group_significance.py -i 88-soils-otus/uc/otu_table_even400.biom -m $SOILS_MAP -c ph_bin -o 88-soils-otus/uc/group_significance_even400.txt

```




Get runtimes
------------

Runtimes are summarized in [this spreadsheet](https://docs.google.com/spreadsheets/d/1eVTVpV6cDj3yfRlVzd_zss_4WgxwDYrlfNmItdrRg9w/edit#gid=0).

```
$ grep "^Logging" moving-pictures-otus/*/log*txt
moving-pictures-otus/uc_fast/log_20140418065704.txt:Logging started at 06:57:04 on 18 Apr 2014
moving-pictures-otus/uc_fast/log_20140418065704.txt:Logging stopped at 13:28:54 on 18 Apr 2014
moving-pictures-otus/uc/log_20140416180632.txt:Logging started at 18:06:32 on 16 Apr 2014
moving-pictures-otus/uc/log_20140416180632.txt:Logging stopped at 01:49:00 on 17 Apr 2014
moving-pictures-otus/ucrC_fast/log_20140418075451.txt:Logging started at 07:54:51 on 18 Apr 2014
moving-pictures-otus/ucrC_fast/log_20140418075451.txt:Logging stopped at 08:36:25 on 18 Apr 2014
moving-pictures-otus/ucrC/log_20140417132227.txt:Logging started at 13:22:27 on 17 Apr 2014
moving-pictures-otus/ucrC/log_20140417132227.txt:Logging stopped at 22:24:09 on 17 Apr 2014
moving-pictures-otus/ucr_fast/log_20140418075501.txt:Logging started at 07:55:01 on 18 Apr 2014
moving-pictures-otus/ucr_fast/log_20140418075501.txt:Logging stopped at 13:17:52 on 18 Apr 2014
moving-pictures-otus/ucr/log_20140417060006.txt:Logging started at 06:00:06 on 17 Apr 2014
moving-pictures-otus/ucr/log_20140417060006.txt:Logging stopped at 18:56:22 on 17 Apr 2014
moving-pictures-otus/ucrss_fast/log_20140418084007.txt:Logging started at 08:40:07 on 18 Apr 2014
moving-pictures-otus/ucrss_fast/log_20140418084007.txt:Logging stopped at 10:00:02 on 18 Apr 2014
moving-pictures-otus/ucrss_fast_wfilter/log_20140418114447.txt:Logging started at 11:44:47 on 18 Apr 2014
moving-pictures-otus/ucrss_fast_wfilter/log_20140418114447.txt:Logging stopped at 20:56:10 on 18 Apr 2014
moving-pictures-otus/ucrss/log_20140417132257.txt:Logging started at 13:22:57 on 17 Apr 2014
moving-pictures-otus/ucrss/log_20140417132257.txt:Logging stopped at 23:34:49 on 17 Apr 2014
moving-pictures-otus/ucrss_wfilter/log_20140418115916.txt:Logging started at 11:59:16 on 18 Apr 2014
moving-pictures-otus/ucrss_wfilter/log_20140418115916.txt:Logging stopped at 05:05:44 on 19 Apr 2014
```

```
$ grep "^Logging" 88-soils-otus/*/log*txt
88-soils-otus/uc_fast/log_20140418065332.txt:Logging started at 06:53:32 on 18 Apr 2014
88-soils-otus/uc_fast/log_20140418065332.txt:Logging stopped at 07:08:46 on 18 Apr 2014
88-soils-otus/uc/log_20140416151050.txt:Logging started at 15:10:50 on 16 Apr 2014
88-soils-otus/uc/log_20140416151050.txt:Logging stopped at 15:31:10 on 16 Apr 2014
88-soils-otus/ucrC_fast/log_20140418072618.txt:Logging started at 07:26:18 on 18 Apr 2014
88-soils-otus/ucrC_fast/log_20140418072618.txt:Logging stopped at 07:27:03 on 18 Apr 2014
88-soils-otus/ucrC/log_20140416155149.txt:Logging started at 15:51:49 on 16 Apr 2014
88-soils-otus/ucrC/log_20140416155149.txt:Logging stopped at 15:55:54 on 16 Apr 2014
88-soils-otus/ucr_fast/log_20140418070846.txt:Logging started at 07:08:46 on 18 Apr 2014
88-soils-otus/ucr_fast/log_20140418070846.txt:Logging stopped at 07:26:18 on 18 Apr 2014
88-soils-otus/ucr/log_20140417055711.txt:Logging started at 05:57:11 on 17 Apr 2014
88-soils-otus/ucr/log_20140417055711.txt:Logging stopped at 06:19:49 on 17 Apr 2014
88-soils-otus/ucrss_fast/log_20140418072703.txt:Logging started at 07:27:03 on 18 Apr 2014
88-soils-otus/ucrss_fast/log_20140418072703.txt:Logging stopped at 07:44:04 on 18 Apr 2014
88-soils-otus/ucrss_fast_wfilter/log_20140418114421.txt:Logging started at 11:44:21 on 18 Apr 2014
88-soils-otus/ucrss_fast_wfilter/log_20140418114421.txt:Logging stopped at 11:54:13 on 18 Apr 2014
88-soils-otus/ucrss/log_20140416155554.txt:Logging started at 15:55:54 on 16 Apr 2014
88-soils-otus/ucrss/log_20140416155554.txt:Logging stopped at 16:20:47 on 16 Apr 2014
88-soils-otus/ucrss_wfilter/log_20140418161924.txt:Logging started at 16:19:24 on 18 Apr 2014
88-soils-otus/ucrss_wfilter/log_20140418161924.txt:Logging stopped at 16:35:51 on 18 Apr 2014
```

```
$ grep "^Logging" whole-body-otus/*/log*txt
whole-body-otus/uc_fast/log_20140418065050.txt:Logging started at 06:50:50 on 18 Apr 2014
whole-body-otus/uc_fast/log_20140418065050.txt:Logging stopped at 06:58:59 on 18 Apr 2014
whole-body-otus/uc/log_20140416151033.txt:Logging started at 15:10:33 on 16 Apr 2014
whole-body-otus/uc/log_20140416151033.txt:Logging stopped at 15:28:48 on 16 Apr 2014
whole-body-otus/ucrC_fast/log_20140418070920.txt:Logging started at 07:09:20 on 18 Apr 2014
whole-body-otus/ucrC_fast/log_20140418070920.txt:Logging stopped at 07:10:33 on 18 Apr 2014
whole-body-otus/ucrC/log_20140416154734.txt:Logging started at 15:47:34 on 16 Apr 2014
whole-body-otus/ucrC/log_20140416154734.txt:Logging stopped at 15:54:16 on 16 Apr 2014
whole-body-otus/ucr_fast/log_20140418065859.txt:Logging started at 06:58:59 on 18 Apr 2014
whole-body-otus/ucr_fast/log_20140418065859.txt:Logging stopped at 07:09:20 on 18 Apr 2014
whole-body-otus/ucr/log_20140417055939.txt:Logging started at 05:59:39 on 17 Apr 2014
whole-body-otus/ucr/log_20140417055939.txt:Logging stopped at 06:17:41 on 17 Apr 2014
whole-body-otus/ucrss_fast/log_20140418071034.txt:Logging started at 07:10:34 on 18 Apr 2014
whole-body-otus/ucrss_fast/log_20140418071034.txt:Logging stopped at 07:22:21 on 18 Apr 2014
whole-body-otus/ucrss_fast_wfilter/log_20140418114407.txt:Logging started at 11:44:07 on 18 Apr 2014
whole-body-otus/ucrss_fast_wfilter/log_20140418114407.txt:Logging stopped at 11:59:50 on 18 Apr 2014
whole-body-otus/ucrss/log_20140416155416.txt:Logging started at 15:54:16 on 16 Apr 2014
whole-body-otus/ucrss/log_20140416155416.txt:Logging stopped at 16:14:28 on 16 Apr 2014
whole-body-otus/ucrss_wfilter/log_20140418120330.txt:Logging started at 12:03:30 on 18 Apr 2014
whole-body-otus/ucrss_wfilter/log_20140418120330.txt:Logging stopped at 12:38:13 on 18 Apr 2014
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
