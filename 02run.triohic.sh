## Identification of haplotype-specific Hi-C reads
/path/HicTrioBinning-main/HTB.sh -M maternal.fasta -P paternal.fasta -1 HiC_1.fq.gz -2 HiC_2.fq.gz -B /path/bwa -S /path/seqtk -O /path/out -I 1

## Extraction of haplotype-specific Hi-C reads
seqtk subseq HiC_1.fq.gz maternal.reads > maternal.reads1.fq
seqtk subseq HiC_2.fq.gz maternal.reads > maternal.reads2.fq
seqtk subseq HiC_1.fq.gz paternal.reads > paternal.reads1.fq
seqtk subseq HiC_2.fq.gz paternal.reads > paternal.reads2.fq
seqtk subseq HiC_1.fq.gz homo.reads > shared.reads1.fq
seqtk subseq HiC_2.fq.gz homo.reads > shared.reads2.fq

## Export and compress the final Hi-C reads
cat maternal.reads1.fq shared.reads1.fq > mat.hic_1.fq && gzip mat.hic_1.fq
cat maternal.reads2.fq shared.reads2.fq > mat.hic_2.fq && gzip mat.hic_2.fq
cat paternal.reads1.fq shared.reads1.fq > pat.hic_1.fq && gzip pat.hic_1.fq
cat paternal.reads2.fq shared.reads2.fq > pat.hic_2.fq && gzip pat.hic_2.fq
