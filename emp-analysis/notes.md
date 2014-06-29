```
cmd = """echo "mkdir /home/caporaso/analysis/2014.04.16-ss-otus/emp-rep-seqs/temp/%s/ ; subsample_fasta.py -i /home/caporaso/analysis/2014.04.16-ss-otus/emp-rep-seqs/rep_set.fna -o /home/caporaso/analysis/2014.04.16-ss-otus/emp-rep-seqs/temp/%s/seqs.fna -p %f; /usr/bin/time -f'%%M %%e' -o /home/caporaso/analysis/2014.04.16-ss-otus/emp-rep-seqs/time_%s.txt -- pick_otus.py -i /home/caporaso/analysis/2014.04.16-ss-otus/emp-rep-seqs/temp/%s/seqs.fna -o /home/caporaso/analysis/2014.04.16-ss-otus/emp-rep-seqs/temp/%s/out --max_accepts 1 --max_rejects 8 --stepwords 8 --word_length 8" | qsub -keo -N %s"""

for i in np.arange(0.01, 0.11, 0.01):
    for j in range(10):
        s = '%1.2f_%d' % (i, j)
        x = cmd % (s, s, i, s, s, s, s)

for i in np.arange(0.20, 0.91, 0.10):
    for j in range(10):
        s = '%1.2f_%d' % (i, j)
        x = cmd % (s, s, i, s, s, s, s)
        print x
%history
```
