FOLDER=$(pwd)
RUF_ASS=$FOLDER/de_novo_assemblies/RufipogonA/RufipogonA.asm.primary.fa.gz
VIA_ASS=$FOLDER/de_novo_assemblies/Vialone_NanoA/Vialone_nanoA.asm.primary.fa.gz
READS_RUF=$FOLDER/F26A910000224_ORYxwbsD/RufipogonA/01.Data_result/HKYD26073191_A.fastq.gz
READS_VIA=$FOLDER/F26A910000224_ORYxwbsD/Vialone_nanoA/01.Data_result/HKYD26073190_A.fastq.gz
RES_RUF=$FOLDER/mapping_rate/O.rufipogon_hifi_vs_contigs.minimap2
RES_VIA=$FOLDER/mapping_rate/VialoneNano_hifi_vs_contigs.minimap2

#minimap2 -ax map-hifi  -t 48 $RUF_ASS $READS_RUF 2> $RES_RUF.log | samtools sort -@ 30 -o $RES_RUF.bam
#minimap2 -ax map-hifi  -t 48 $VIA_ASS $READS_RUF 2> $RES_VIA.log | samtools sort -@ 30 -o $RES_VIA.bam


#samtools index $RES_VIA.bam
#samtools index $RES_RUF.bam

samtools flagstat $RES_RUF.bam |tee $RES_RUF.flagstat
samtools flagstat $RES_VIA.bam |tee $RES_VIA.flagstat
