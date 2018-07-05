#!/bin/bash
echo "Please Enter DOCKER_VERSION :"
read docker_version
echo "Please Enter HAA :"
read haa
echo "Please Eneter TENANT :"
read tenant
echo "Please Eneter ENV :"
read envi
echo "Please Eneter ETCD :"
read endpoints


file=source.tf
modfile=${file%.tf}_$envi.tf

if [ -e $file ]
then
  cp $file $modfile
else
  echo "$file is not existing!!!!"
fi


sed -i -e "s/\(DOCKER_VERSION=\).*/\1$docker_version/" \
-e "s/\(HAA=\).*/\1$haa"\""/" \
-e "s/\(TENANT=\).*/\1$tenant"\""/" \
-e "s/\(ENV=\).*/\1$envi"\""/" \
-e 's;\(endpoints \).*;\1\\'\"''$endpoints'\\'\"''\"' ;' $modfile 
