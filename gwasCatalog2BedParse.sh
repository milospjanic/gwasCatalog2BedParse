#!/bin/bash
#download gwas catalog and create bed file with chr;position;position+1;proxy_gene;phenotype
echo "
#download gwas catalog 
wget http://www.genome.gov/admin/gwascatalog.txt

head -n1 gwascatalog.txt> header 
tail -n +2 gwascatalog.txt > tmp
mv tmp gwascatalog.txt

awk -F\"\t\" '{if (\$12!=\"\") print \$12\"\t\"\$13\"\t\"\$15\"\t\"\$8}' gwascatalog.txt > tmp
awk -F\"\t\" '{print \$1\"\t\"\$2\"\t\"\$2+1\"\t\"\$3\"\t\"\$4}' tmp > GwasCatalog.bed
rm tmp" > GwasCatalog2Bed.sh
chmod 775 GwasCatalog2Bed.sh
./GwasCatalog2Bed.sh

#adding CardiogramPlusC4D to GWASCatalog
awk -F"\t" '{print $1"\t"$2"\t"$3"\t"$4"\t","CardiogramPlusC4D"}' CARDIOGRAMplusC4DleadSNPs.bed  > CARDIOGRAMC4Dplusnovel.txt.tmp
sed -i 's/^chr//g' CARDIOGRAMC4Dplusnovel.txt.tmp
cat CARDIOGRAMC4Dplusnovel.txt.tmp >> GwasCatalog.bed
rm CARDIOGRAMC4Dplusnovel.txt.tmp
sed -i 's/\//-/g' GwasCatalog.bed 

awk -F"\t" '{print $12"\t"$13"\t"$13"\t"$15"\t"$8}' header | cat - GwasCatalog.bed > tmp && mv tmp GwasCatalog.bed

awk -F'\t' '
    FNR == 1 { header = $0;next }
    !seen[$5]++ { print header > ("GWASCatalogPhenotype_"$5".txt") }
    {
        print > ("GWASCatalogPhenotype_"$5".txt");
    }
' GwasCatalog.bed
