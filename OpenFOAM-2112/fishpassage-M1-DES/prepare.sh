#! /bin/bash
. /usr/lib/openfoam/openfoam2112/etc/bashrc

rm -r constant/polyMesh
rm -r 0
rm -r processor*
gmsh -3 base.geo -o base.msh
gmshToFoam base.msh
surfaceFeatureExtract
# ------------------------------------------
# Run snappyHexMesh in parallel.
# This might be a bit more difficut to setup in cluster environments
cp system/decomposeParDict.scotch system/decomposeParDict
decomposePar
cp system/decomposeParDict.ptscotch system/decomposeParDict
mpirun -np 24 snappyHexMesh -parallel -overwrite | tee log.snappy
reconstructParMesh -constant
renumberMesh -overwrite
cp system/decomposeParDict.scotch system/decomposeParDict
rm -r processor*
# ------------------------------------------
# Run snappyHexMesh serially.
#snappyHexMesh -overwrite
#renumberMesh -overwrite
cp system/decomposeParDict.scotch system/decomposeParDict
# ------------------------------------------

checkMesh

cp -r 0.model 0

setFields

decomposePar -force
