#!/bin/bash
#download gwas catalog and create bed file with chr;position;position+1;proxy_gene;phenotype
#download gwas catalog 
wget https://www.dropbox.com/s/305f4dsbpkdtw3c/full.mod.crossmap.plus.snpsnpinteract.header
mv full.mod.crossmap.plus.snpsnpinteract.header GwasCatalog.bed

echo "
head -n1 GwasCatalog.bed> header 
tail -n +2 GwasCatalog.bed > tmp
mv tmp GwasCatalog.bed

" > GwasCatalog2Bed.sh
chmod 775 GwasCatalog2Bed.sh
./GwasCatalog2Bed.sh

#adding CardiogramPlusC4D to GWASCatalog

wget https://www.mediafire.com/file/1pc7ucej8d4aetu/CARDIOGRAMplusC4DleadSNPs.bed
#mv pqxkuzwgv8bhl8ne05a3ohlmzgwbir28.bed CARDIOGRAMplusC4DleadSNPs.bed

awk -F"\t" '{print $1"\t"$2"\t"$3"\t"$4"\t","CardiogramPlusC4D"}' CARDIOGRAMplusC4DleadSNPs.bed  > CARDIOGRAMC4Dplusnovel.txt.tmp
#sed -i 's/^chr//g' CARDIOGRAMC4Dplusnovel.txt.tmp
cat CARDIOGRAMC4Dplusnovel.txt.tmp >> GwasCatalog.bed
rm CARDIOGRAMC4Dplusnovel.txt.tmp
sed -i 's/\//-/g' GwasCatalog.bed 

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
