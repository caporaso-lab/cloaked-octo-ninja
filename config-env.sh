#!/bin/bash

# define the ``PROJECT_DIR`` environment variable as
# the absolute path to your project directory
export PROJECT_DIR=/home/caporaso/analysis/2014.04.16-ss-otus/

# define the ``REF_DIR`` environment variable as the
# absolute path to your  Greengenes reference sequences directory
export REF_DIR=/data/gg_13_8_otus/
export REF_SEQS_DIR=$REF_DIR/rep_set/
export REF_TAX_DIR=$REF_DIR/taxonomy/
export REF_TREE_DIR=$REF_DIR/trees/

export REF_SEQS=$REF_SEQS_DIR/97_otus.fasta
export REF_TAX=$REF_TAX_DIR/97_otu_taxonomy.txt
export REF_TREE=$REF_TREE_DIR/97_otus.tree

export REF_SEQS_61=$REF_SEQS_DIR/61_otus.fasta
export REF_TAX_61=$REF_TAX_DIR/61_otu_taxonomy.txt
export REF_TREE_61=$REF_TREE_DIR/61_otus.tree

export REF_SEQS_73=$REF_SEQS_DIR/73_otus.fasta
export REF_TAX_73=$REF_TAX_DIR/73_otu_taxonomy.txt
export REF_TREE_73=$REF_TREE_DIR/73_otus.tree

export REF_SEQS_82=$REF_SEQS_DIR/82_otus.fasta
export REF_TAX_82=$REF_TAX_DIR/82_otu_taxonomy.txt
export REF_TREE_82=$REF_TREE_DIR/82_otus.tree

export TINY_TEST_MAP=$PROJECT_DIR/tiny-test/map
export TINY_TEST_SEQS=$PROJECT_DIR/tiny-test/seqs

# define the ``MOVING_PICTURES_SEQS``, ``SOILS_SEQS``, and ``WHOLE_BODY_SEQS``
# environment variables as the absolute paths to the post-split-libraries
# sequence files that you downloaded from the QIIME DB. You do not need to define
# the ``*_MAP`` environment variables as modified mapping files are included
# in this repository.
export MOVING_PICTURES_MAP=$PROJECT_DIR/sample-metadata/moving-pictures-map.txt
export MOVING_PICTURES_SEQS=/home/caporaso/analysis/moving-pictures/study_550_split_library_seqs.fna

export SOILS_MAP=$PROJECT_DIR/sample-metadata/soils-map.txt
export SOILS_SEQS=/home/caporaso/analysis/88-soils/study_103_split_library_seqs.fna

export WHOLE_BODY_MAP=$PROJECT_DIR/sample-metadata/whole-body-map.txt
export WHOLE_BODY_SEQS=/home/caporaso/analysis/whole-body/study_449_split_library_seqs.fna
