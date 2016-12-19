#!/usr/bin/env bash

set -e

export RELEASE_APP_EXE=Release/shared.exe 
export RELEASE_UPX_EXE=Release/upxed/shared.exe 
export APP_EXE="*.lib"

make clean    
make all      
cp -p /bin/bash.exe $RELEASE_APP_EXE
#make upx     
cp -p $RELEASE_APP_EXE $RELEASE_UPX_EXE
#make sign    
cp -p $RELEASE_UPX_EXE $(basename $RELEASE_UPX_EXE)
make hashes    
make zip       
make tag      
make release  
make sig      
make sum      
make upload   
