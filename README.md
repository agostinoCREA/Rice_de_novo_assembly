---
type: Project
year: 2026
month: September
authors:
  - Agostino Fricano
tags:
  - "#Micro4Life"
  - "#de_novo"
project: MICRO4LIFE
---
# Sample list
-Vialone_nanoA
-RufipogonA

# Data

## Folder
/home/agostino/NAS2/Rice_de_novo
## Report from BGI
[report_en.pdf](file:///Y:/Rice_de_novo/F26A910000224_ORYxwbsD/report/report_en.pdf)
# Materials and methods

## Sequencing and raw data

## De novo assembly using hifiasm
### Folder
/home/agostino/NAS2/Rice_de_novo/scripts/de_novo_assembly.sh
### Code

``` bash
READS=/home/agostino/NAS2/Rice_de_novo/F26A910000224_ORYxwbsD/Vialone_nanoA/01.Data_result/HKYD26073190_A.fastq.gz
RESULTS=/home/agostino/NAS2/Rice_de_novo/de_novo_assemblies/Vialone_NanoA/Vialone_nanoA.asm
LOG=/home/agostino/NAS2/Rice_de_novo/de_novo_assemblies/Vialone_NanoA/Vialone_nanoA.log


hifiasm -o $RESULTS -t 48 -l 0 $READS 2> $LOG
```

## Busco analyses
### Folder
/media/agostino/12TBdisk/Rice_de_novo/scripts/busco_analyses.sh
#### Results
- /media/agostino/12TBdisk/Rice_de_novo/RufipogonA/busco/RufipogonA_busco
- /media/agostino/12TBdisk/Rice_de_novo/Vialone_NanoA/busco/Vialone_nanoA_busco

### Code
cd /media/agostino/12TBdisk/Rice_de_novo
bash ./scripts/busco_analyses.sh
```bash
# conda activate busco
FOLDER=$(pwd)
RESULTS=$FOLDER/de_novo_assemblies/RufipogonA/RufipogonA.asm
RESULTS2=$FOLDER/de_novo_assemblies/Vialone_NanoA/Vialone_nanoA.asm
OUT=./RufipogonA/busco/RufipogonA_busco
OUT2=./Vialone_NanoA/busco/Vialone_nanoA_busco
echo $FOLDER

_JAVA_OPTIONS="-Xmx64g" busco -i $RESULTS.primary.fa  -m genome -l poales_odb12.2 -o $OUT  -c 32 -f
_JAVA_OPTIONS="-Xmx64g" busco -i $RESULTS2.primary.fa  -m genome -l poales_odb12.2 -o $OUT2  -c 32 -f

```

## Merqury analyses

### Folder
/media/agostino/12TBdisk/Rice_de_novo/scripts/merqury.sh
#### Results
/media/agostino/12TBdisk/Rice_de_novo/RufipogonA/merqury
/media/agostino/12TBdisk/Rice_de_novo/Vialone_NanoA/merqury
### Code
cd /media/agostino/12TBdisk/Rice_de_novo
bash ./scripts/merqury.sh
conda activate merqury_env

```bash
# conda activate merqury_env
FOLDER=$(pwd)

RUF_ASS=$FOLDER/de_novo_assemblies/RufipogonA/RufipogonA.asm.primary.fa
VIA_ASS=$FOLDER/de_novo_assemblies/Vialone_NanoA/Vialone_nanoA.asm.primary.fa
READS=$FOLDER/F26A910000224_ORYxwbsD/RufipogonA/01.Data_result/HKYD26073191_A.fastq.gz
READS_V=$FOLDER/F26A910000224_ORYxwbsD/Vialone_nanoA/01.Data_result/HKYD26073190_A.fastq.gz


mkdir -p $FOLDER/RufipogonA/merqury
meryl k=21 threads=48 memory=100g count output $FOLDER/RufipogonA/merqury/RufipogonA.meryl $READS

mkdir -p $FOLDER/Vialone_NanoA/merqury
meryl k=21 threads=48 memory=100g count output $FOLDER/Vialone_NanoA/merqury/Vialone_NanoA.meryl $READS_V

echo "Analysing rufipogon......"
merqury.sh $FOLDER/RufipogonA/merqury/RufipogonA.meryl $RUF_ASS RufipogonA_merqury

echo "Analysing Vialone Nano......"
merqury.sh $FOLDER/Vialone_NanoA/merqury/Vialone_NanoA.meryl  $VIA_ASS Vialone_NanoA_merqury
```

## Mapping rate
```bash
FOLDER=$(pwd)
RUF_ASS=$FOLDER/de_novo_assemblies/RufipogonA/RufipogonA.asm.primary.fa
VIA_ASS=$FOLDER/de_novo_assemblies/Vialone_NanoA/Vialone_nanoA.asm.primary.fa
READS_RUF=$FOLDER/F26A910000224_ORYxwbsD/RufipogonA/01.Data_result/HKYD26073191_A.f
READS_VIA=$FOLDER/F26A910000224_ORYxwbsD/Vialone_nanoA/01.Data_result/HKYD26073190_A.fastq.gz
RES_RUF=$FOLDER/mapping_rate/O.rufipogon_hifi_vs_contigs.minimap2
astq.gz
RES_VIA=$FOLDER/mapping_rate/VialoneNano_hifi_vs_contigs.minimap2
astq.gz

minimap2 -ax map-hifi  -t 48 $RUF_ASS $READS_RUF 2> $RES_RUF.log | samtools sort -@ 30 -o $RES_RUF.bam

minimap2 -ax map-hifi  -t 48 $VIA_ASS $READS_RUF 2> $RES_VIA.log | samtools sort -@ 30 -o $RES_VIA.bam

```




# Results
## _de novo_ assembly

_here I must report the parameters of the assembly for the two accessions
## BUSCO analyses

#### Vialone Nano
BUSCO version is: 6.1.0 
The lineage dataset is: poales_odb12.2 (Creation date: 2026-05-13, number of genomes: 16, number of BUSCOs: 6188)
Summarized benchmarking in BUSCO notation for file /media/agostino/12TBdisk/Rice_de_novo/de_novo_assemblies/Vialone_NanoA/Vialone_nanoA.asm.primary.fa
BUSCO was run in mode: euk_genome_min
Gene predictor used: miniprot

	***** Results: *****

	C:99.7%[S:98.6%,D:1.0%],F:0.0%,M:0.3%,n:6188,E:2.0%	   
	6168	Complete BUSCOs (C)	(of which 126 contain internal stop codons)		   
	6104	Complete and single-copy BUSCOs (S)	   
	64	Complete and duplicated BUSCOs (D)	   
	3	Fragmented BUSCOs (F)			   
	17	Missing BUSCOs (M)			   
	6188	Total BUSCO groups searched		   

Assembly Statistics:
	466	Number of scaffolds
	466	Number of contigs
	403139572	Total length
	0.000%	Percent gaps
	24 Mbp	Scaffold N50
	24 Mbp	Contigs N50


Dependencies and versions:
	hmmsearch: 3.4
	bbtools: None
	miniprot_index: 0.18-r281
	miniprot_align: 0.18-r281


#### _O. rufipogon_
BUSCO version is: 6.1.0 
The lineage dataset is: poales_odb12.2 (Creation date: 2026-05-13, number of genomes: 16, number of BUSCOs: 6188)
Summarized benchmarking in BUSCO notation for file /media/agostino/12TBdisk/Rice_de_novo/de_novo_assemblies/RufipogonA/RufipogonA.asm.primary.fa
BUSCO was run in mode: euk_genome_min
Gene predictor used: miniprot

	***** Results: *****

	C:99.6%[S:98.6%,D:1.0%],F:0.0%,M:0.3%,n:6188,E:2.1%	   
	6165	Complete BUSCOs (C)	(of which 132 contain internal stop codons)		   
	6102	Complete and single-copy BUSCOs (S)	   
	63	Complete and duplicated BUSCOs (D)	   
	3	Fragmented BUSCOs (F)			   
	20	Missing BUSCOs (M)			   
	6188	Total BUSCO groups searched		   

Assembly Statistics:
	356	Number of scaffolds
	356	Number of contigs
	402679207	Total length
	0.000%	Percent gaps
	30 Mbp	Scaffold N50
	30 Mbp	Contigs N50


Dependencies and versions:
	hmmsearch: 3.4
	bbtools: None
	miniprot_index: 0.18-r281
	miniprot_align: 0.18-r281

## Merqury analyses
To further assess the quality of 
#### _O. rufipogon_
Results are stored in /media/agostino/12TBdisk/Rice_de_novo/RufipogonA/merqury (both analysis on reads and assembly)
__QV__
RufipogonA.asm.primary	7026	402672087	60.8046	8.30885e-07
__Completeness__
RufipogonA.asm.primary	all	273486472	274149844	99.758
#### Vialone Nano
__QV__
Vialone_nanoA.asm.primary	7249	403130252	60.6738	8.56283e-07
__Completeness__
Vialone_nanoA.asm.primary	all	272231835	272971360	99.7291

## Mapping rate
###  O.rufipogon_hifi_vs_contigs.minimap2.flagstat
1699487 + 0 in total (QC-passed reads + QC-failed reads)
1276971 + 0 primary
420311 + 0 secondary
2205 + 0 supplementary
0 + 0 duplicates
0 + 0 primary duplicates
1699247 + 0 mapped (99.99% : N/A)
1276731 + 0 primary mapped (99.98% : N/A)
0 + 0 paired in sequencing
0 + 0 read1
0 + 0 read2
0 + 0 properly paired (N/A : N/A)
0 + 0 with itself and mate mapped
0 + 0 singletons (N/A : N/A)
0 + 0 with mate mapped to a different chr
0 + 0 with mate mapped to a different chr (mapQ>=5)
c
### VialoneNano_hifi_vs_contigs.minimap2.flagstat
4300467 + 0 in total (QC-passed reads + QC-failed reads)
1276971 + 0 primary
1893502 + 0 secondary
1129994 + 0 supplementary
0 + 0 duplicates
0 + 0 primary duplicates
4300065 + 0 mapped (99.99% : N/A)
1276569 + 0 primary mapped (99.97% : N/A)
0 + 0 paired in sequencing
0 + 0 read1
0 + 0 read2
0 + 0 properly paired (N/A : N/A)
0 + 0 with itself and mate mapped
0 + 0 singletons (N/A : N/A)
0 + 0 with mate mapped to a different chr
0 + 0 with mate mapped to a different chr (mapQ>=5)
