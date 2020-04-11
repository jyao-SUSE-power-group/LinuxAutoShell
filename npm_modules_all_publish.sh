#! /bin/bash

## cd node_modules
## curl -s https://raw.githubusercontent.com/jyao-SUSE-power-group/LinuxAutoShell/master/npm_modules_all_publish.sh | bash -s
# before 
npm config set ignore_prepublish true
for json in `find -name package.json`

do
  cd ${json/%package.json/''}
  npm publish
  cd ../
  
done

npm config set ignore_prepublish false
