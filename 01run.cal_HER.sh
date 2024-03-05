sed 1d out.hapmers.count | grep 'hap1' - > hap1.txt
awk '{print$3"\t"$4}' hap1.txt | awk '{print$1"\t"$2"\t"$1-$2"\t"$1+$2}' - > 1.txt
awk '{if($3 > 0)print}' 1.txt | awk '{print$2}' - > 2.txt
awk '{if($3 < 0)print}' 1.txt | awk '{print$1}' - > 3.txt
awk '{if($3 == 0)print}' 1.txt | awk '{print$1}' - > 4.txt
cat 2.txt 3.txt 4.txt > min.txt
awk '{print $1}' min.txt | awk '{sum+=$1}END{print sum}' > min.sum.txt
awk '{print$4}' 1.txt > all.txt
awk '{print $1}' all.txt | awk '{sum+=$1}END{print sum}' > all.sum.txt
paste min.sum.txt all.sum.txt | awk '{print$1/$2}' - | awk '{$1*=100;print $0}' -
rm -r *.txt
sed 1d out.hapmers.count | grep 'hap2' - > hap2.txt
awk '{print$3"\t"$4}' hap2.txt | awk '{print$1"\t"$2"\t"$1-$2"\t"$1+$2}' - > 1.txt
awk '{if($3 > 0)print}' 1.txt | awk '{print$2}' - > 2.txt
awk '{if($3 < 0)print}' 1.txt | awk '{print$1}' - > 3.txt
awk '{if($3 == 0)print}' 1.txt | awk '{print$1}' - > 4.txt
cat 2.txt 3.txt 4.txt > min.txt
awk '{print $1}' min.txt | awk '{sum+=$1}END{print sum}' > min.sum.txt
awk '{print$4}' 1.txt > all.txt
awk '{print $1}' all.txt | awk '{sum+=$1}END{print sum}' > all.sum.txt
paste min.sum.txt all.sum.txt | awk '{print$1/$2}' - | awk '{$1*=100;print $0}' -
rm -r *.txt
