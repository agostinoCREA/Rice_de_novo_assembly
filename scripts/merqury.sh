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