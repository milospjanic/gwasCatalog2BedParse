#!/bin/bash
#download gwas catalog and create bed file with chr;position;position+1;proxy_gene;phenotype
echo "
#download gwas catalog 

wget https://www.dropbox.com/s/305f4dsbpkdtw3c/full.mod.crossmap.plus.snpsnpinteract.header
mv full.mod.crossmap.plus.snpsnpinteract.header GwasCatalog.bed


head -n1 GwasCatalog.bed> header 
tail -n +2 GwasCatalog.bed > tmp
mv tmp GwasCatalog.bed

#awk -F\"\t\" '{if (\$12!=\"\") print \$12\"\t\"\$13\"\t\"\$15\"\t\"\$8}' gwascatalog.txt > tmp
#awk -F\"\t\" '{print \$1\"\t\"\$2\"\t\"\$2+1\"\t\"\$3\"\t\"\$4}' tmp > GwasCatalog.bed
#rm tmp" > GwasCatalog2Bed.sh
#chmod 775 GwasCatalog2Bed.sh
#./GwasCatalog2Bed.sh

#adding CardiogramPlusC4D to GWASCatalog
awk -F"\t" '{print $1"\t"$2"\t"$3"\t"$4"\t","CardiogramPlusC4D"}' CARDIOGRAMplusC4DleadSNPs.bed  > CARDIOGRAMC4Dplusnovel.txt.tmp
sed -i 's/^chr//g' CARDIOGRAMC4Dplusnovel.txt.tmp
cat CARDIOGRAMC4Dplusnovel.txt.tmp >> GwasCatalog.bed
rm CARDIOGRAMC4Dplusnovel.txt.tmp
#sed -i 's/\//-/g' GwasCatalog.bed 

awk -F"\t" '{print $1"\t"$2"\t"$3"\t"$4"\t"$5}' header | cat - GwasCatalog.bed > tmp && mv tmp GwasCatalog.bed

mkdir parsed_files

awk -F'\t' '
    FNR == 1 { header = $0;next }
    !seen[$5]++ { print header > ("parsed_files/GWASCatalogPhenotype_"$5".txt") }
    {
        print > ("parsed_files/GWASCatalogPhenotype_"$5".txt");
    }
' GwasCatalog.bed
rm header
