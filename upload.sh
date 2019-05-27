#!/bin/bash

VersionNumber=`grep -E 's.version.*=' ddapi.podspec | awk -F"[\"\"]" '{print $2}'`
#
function increment_version ()
{
  declare -a part=( ${1//\./ } )
  declare    new
  declare -i carry=1

  for (( CNTR=${#part[@]}-1; CNTR>=0; CNTR-=1 )); do
    len=${#part[CNTR]}
    new=$((part[CNTR]+carry))
    [ ${#new} -gt $len ] && carry=1 || carry=0
    [ $CNTR -gt 0 ] && part[CNTR]=${new: -len} || part[CNTR]=${new}
  done
  new="${part[*]}"
  echo -e "${new// /.}"

} 
#
NewVersionNumber=$(increment_version ${VersionNumber})

LineNumber=`grep -nE 's.version.*=' ddapi.podspec | cut -d : -f1`
sed -i "" "${LineNumber}s/${VersionNumber}/${NewVersionNumber}/g" ddapi.podspec

echo "current version is ${VersionNumber}, new version is ${NewVersionNumber}"

git add .
git commit -am ${NewVersionNumber}
git tag ${NewVersionNumber}
git push origin master --tags
pod repo push ddrepo ddapi.podspec --verbose --allow-warnings --use-libraries --use-modular-headers

