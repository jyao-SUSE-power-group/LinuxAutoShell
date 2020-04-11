#! /bin/bash

# before 
npm config set ignore_prepublish true
for json in `find -name package.json`

do
  cd ${json/%package.json/''}
  npm publish
  cd ../
  
done

npm config set ignore_prepublish false
