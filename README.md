# GPOG
Bash Command For Global Phased Octoploid Genome (GPOG)


# Calculation of HER Hamming error rate (HER)
```
sh 01run.cal_HER.sh
Note: The HER formula is: ∑i min{pi, mi} / ∑i (pi + mi)
```

# Trio Hi-C (Haplotype-specific reads)
```
sh 02run.triohic.sh
Note: Shared Hi-C reads need to be added back
```
<img src="https://github.com/jinxin112233/GPOG/assets/72123585/7ec1bf9c-f6d3-4e66-a7e4-8754e60e9ed6" width="1400" height="280">

# Analysis of centromeres
```
sh 03run.cen_analysis.sh
Note: Only take chromosomes 1A, 1B as an example
```
