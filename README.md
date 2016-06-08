# gwasCatalog2BedParse

This is the script that will connect to http://www.genome.gov, download GWAS Catalog, convert it to a bed file with columns chr;position;position+1;proxy_gene;phenotype, and then create separate bed files for each unique GWAS Catalog category from 5th column.

Script will create and call subscripts GwasCatalog2Bed.sh.GwasCatalog2Bed.sh will not be removed and you can use it afterwards to download whole GWAS Catalog in bed format.

Script will create parsed bed files in a folder **parsed_files**

Files that will be generated are: 

**GwasCatalog.bed**, which contains shorter bed version of the entire GWAS Catalog and phenotype specific bed files.
**gwascatalog.txt**, complete gwas catalog.
**GwasCatalog2Bed.sh** subsript
**GWASCatalogPhenotype_ files** individual parsed bed files in parsed_files folder

There are **1107** parsed output files

<pre>
GWASCatalogPhenotype_5-HTT brain serotonin transporter levels.txt
GWASCatalogPhenotype_Abdominal aortic aneurysm.txt
GWASCatalogPhenotype_Acenocoumarol maintenance dosage.txt
GWASCatalogPhenotype_Acne (severe).txt
GWASCatalogPhenotype_Activated partial thromboplastin time.txt
GWASCatalogPhenotype_Acute lymphoblastic leukemia (B-cell precursor).txt
GWASCatalogPhenotype_Acute lymphoblastic leukemia (childhood).txt
GWASCatalogPhenotype_Acute urticaria and angioedema (non-steroidal anti-inflammatory drug-induced).txt
GWASCatalogPhenotype_Addiction.txt
GWASCatalogPhenotype_Adiponectin levels.txt
mpjanic@zoran:~/temp3/parsed_files$ ls -1 * | head -n50
GWASCatalogPhenotype_5-HTT brain serotonin transporter levels.txt
GWASCatalogPhenotype_Abdominal aortic aneurysm.txt
GWASCatalogPhenotype_Acenocoumarol maintenance dosage.txt
GWASCatalogPhenotype_Acne (severe).txt
GWASCatalogPhenotype_Activated partial thromboplastin time.txt
GWASCatalogPhenotype_Acute lymphoblastic leukemia (B-cell precursor).txt
GWASCatalogPhenotype_Acute lymphoblastic leukemia (childhood).txt
GWASCatalogPhenotype_Acute urticaria and angioedema (non-steroidal anti-inflammatory drug-induced).txt
GWASCatalogPhenotype_Addiction.txt
GWASCatalogPhenotype_Adiponectin levels.txt
GWASCatalogPhenotype_Adiposity in newborns.txt
GWASCatalogPhenotype_Adiposity.txt
GWASCatalogPhenotype_Adolescent idiopathic scoliosis (severe).txt
GWASCatalogPhenotype_Adolescent idiopathic scoliosis.txt
GWASCatalogPhenotype_Adverse response to aromatase inhibitors.txt
GWASCatalogPhenotype_Adverse response to carbamapezine.txt
GWASCatalogPhenotype_Adverse response to chemotherapy in breast cancer (alopecia) (anti-microtubule).txt
GWASCatalogPhenotype_Adverse response to chemotherapy in breast cancer (alopecia) (cyclophosphamide+doxorubicin+--5FU).txt
GWASCatalogPhenotype_Adverse response to chemotherapy in breast cancer (alopecia) (cyclophosphamide+epirubicin+--5FU).txt
GWASCatalogPhenotype_Adverse response to chemotherapy in breast cancer (alopecia) (docetaxel).txt
GWASCatalogPhenotype_Adverse response to chemotherapy in breast cancer (alopecia) (paclitaxel).txt
GWASCatalogPhenotype_Adverse response to chemotherapy in breast cancer (alopecia).txt
GWASCatalogPhenotype_Adverse response to chemotherapy (neutropenia-leucopenia) (5-fluorouracil).txt
GWASCatalogPhenotype_Adverse response to chemotherapy (neutropenia-leucopenia) (all anthracycline-based drugs).txt
GWASCatalogPhenotype_Adverse response to chemotherapy (neutropenia-leucopenia) (all antimetabolite drugs).txt
GWASCatalogPhenotype_Adverse response to chemotherapy (neutropenia-leucopenia) (all antimicrotubule drugs).txt
GWASCatalogPhenotype_Adverse response to chemotherapy (neutropenia-leucopenia) (all platinum-based drugs).txt
GWASCatalogPhenotype_Adverse response to chemotherapy (neutropenia-leucopenia) (all topoisomerase inhibitors).txt
GWASCatalogPhenotype_Adverse response to chemotherapy (neutropenia-leucopenia) (camptothecin).txt
GWASCatalogPhenotype_Adverse response to chemotherapy (neutropenia-leucopenia) (carboplatin).txt
GWASCatalogPhenotype_Adverse response to chemotherapy (neutropenia-leucopenia) (cisplatin).txt
GWASCatalogPhenotype_Adverse response to chemotherapy (neutropenia-leucopenia) (cyclophosphamide).txt
GWASCatalogPhenotype_Adverse response to chemotherapy (neutropenia-leucopenia) (docetaxel).txt
GWASCatalogPhenotype_Adverse response to chemotherapy (neutropenia-leucopenia) (doxorubicin).txt
GWASCatalogPhenotype_Adverse response to chemotherapy (neutropenia-leucopenia) (epirubicin).txt
GWASCatalogPhenotype_Adverse response to chemotherapy (neutropenia-leucopenia) (etoposide).txt
GWASCatalogPhenotype_Adverse response to chemotherapy (neutropenia-leucopenia) (gemcitabine).txt
GWASCatalogPhenotype_Adverse response to chemotherapy (neutropenia-leucopenia) (paclitaxel + carboplatin).txt
GWASCatalogPhenotype_Adverse response to chemotherapy (neutropenia-leucopenia) (paclitaxel).txt
GWASCatalogPhenotype_Adverse response to lamotrigine and phenytoin.txt
GWASCatalogPhenotype_Adverse response to radiation therapy.txt
GWASCatalogPhenotype_Age of smoking initiation.txt
GWASCatalogPhenotype_Age-related hearing impairment (interaction).txt
GWASCatalogPhenotype_Age-related hearing impairment.txt
GWASCatalogPhenotype_Age-related macular degeneration (CNV).txt
GWASCatalogPhenotype_Age-related macular degeneration (CNV vs. GA).txt
GWASCatalogPhenotype_Age-related macular degeneration (extreme sampling).txt
GWASCatalogPhenotype_Age-related macular degeneration (GA).txt
GWASCatalogPhenotype_Age-related macular degeneration (smoking status interaction).txt
GWASCatalogPhenotype_Age-related macular degeneration.txt
...
</pre>
