FOLDER=$(pwd)
RESULTS=$FOLDER/de_novo_assemblies/RufipogonA/RufipogonA.asm
RESULTS2=$FOLDER/de_novo_assemblies/Vialone_NanoA/Vialone_nanoA.asm
OUT=./RufipogonA/busco/RufipogonA_busco
OUT2=./Vialone_NanoA/busco/Vialone_nanoA_busco
echo $FOLDER

_JAVA_OPTIONS="-Xmx64g" busco -i $RESULTS.primary.fa  -m genome -l poales_odb12.2 -o $OUT  -c 32 -f
_JAVA_OPTIONS="-Xmx64g" busco -i $RESULTS2.primary.fa  -m genome -l poales_odb12.2 -o $OUT2  -c 32 -f
