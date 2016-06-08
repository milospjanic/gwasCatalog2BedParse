# gwasCatalog2BedParse

This is the script that will connect to http://www.genome.gov, download GWAS Catalog, convert it to a bed file with columns chr;position;position+1;proxy_gene;phenotype, and then create separate bed files for each unique GWAS Catalog category from 5th column.

Script will create and call subscripts GwasCatalog2Bed.sh.GwasCatalog2Bed.sh will not be removed and you can use it afterwards to download whole GWAS Catalog in bed format.

Files that will be generated are: 
<pre>
**GwasCatalog.bed**, which contains shorter bed version of the entire GWAS Catalog and phenotype specific bed files.
**gwascatalog.txt**, complete gwas catalog.


