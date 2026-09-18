#READS=/home/agostino/NAS2/Rice_de_novo/F26A910000224_ORYxwbsD/Vialone_nanoA/01.Data_result/HKYD26073190_A.fastq.gz
READS=/home/agostino/NAS2/Rice_de_novo/F26A910000224_ORYxwbsD/RufipogonA/01.Data_result/HKYD26073191_A.fastq.gz

#RESULTS=/home/agostino/NAS2/Rice_de_novo/de_novo_assemblies/Vialone_NanoA/Vialone_nanoA.asm
RESULTS=/home/agostino/NAS2/Rice_de_novo/de_novo_assemblies/RufipogonA/RufipogonA.asm
#LOG=/home/agostino/NAS2/Rice_de_novo/de_novo_assemblies/Vialone_NanoA/Vialone_nanoA.log
LOG=/home/agostino/NAS2/Rice_de_novo/de_novo_assemblies/RufipogonA/RufipogonA.log


hifiasm -o $RESULTS -t 48 -l 0 $READS  2>&1 | tee $LOG
awk '/^S/{print ">"$2;print $3}' $RESULTS.bp.p_ctg.gfa  > $RESULTS.primary.fa

bgzip $RESULTS.primary.fa
samtools faidx $RESULTS.primary.fa.gz
