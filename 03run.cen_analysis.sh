##Identification and clustering of tandem repeats
centromics -l HiFi.reads.fa -g genome.fa -pre hifi -outdir hifi -tmpdir hifi.tmp &>hifi.log

##Comparison of tandem repeat cluster with conserved centromere satellites
makeblastdb -in Cen.fa -dbtype nucl -parse_seqids -out ./index
blastn -task megablast -query hifi.trf.fa -db ./index -evalue 1e-4 -outfmt 6 -num_threads 18 -out out.txt

## Identification of centromere candidate regions
grep 'CL3' hifi.candidate_peaks.bed | awk '{print$1"\t"$2"\t"$3}' - > cen_candidate.bed

##Identification of all classes of centromeric satellites in centromeric candidate regions
seqtk subseq genome.fa cen_candidate.bed > cen_candidate.fa
trf cen_candidate.fa 2 7 7 80 10 50 500 -m -f -d

##Identification of the primary centromeric satellites of chromosome 1A
grep '1A' *.dat > 1A.dat
awk '{if($3>145)print}' 1A.dat | awk '{if($3<149)print}' | sort -n -k 4 - | tail -n 1 | awk '{print$14}' - > 1A.cen.fa

##Calculation of genetic distances between primary centromeric satellites
mkdir input && mv *.cen.fa input
skmer reference input -k 13

##Calculation of Average Nucleotide Identity (ANI) between primary centromeric satellites
ls *.cen.fa > 1.txt
ls *.cen.fa > 2.txt
fastANI --ql 1.txt --rl 2.txt -o out.txt --fragLen 100 -t 10 --matrix
