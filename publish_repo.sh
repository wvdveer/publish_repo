#!/bin/bash

REPO_URL="http://gitea.server/api/packages/gitslave/maven"
REPO_ID="giteaPackagesRepo"
LOCAL_REPO="/var/opt/mavenrepo"

find "${LOCAL_REPO}" -type f -name "*.jar" | while read -r jar_file; do
  IFS='/' read -ra parts <<< "$jar_file"
  groupId="${parts[${#parts[@]}-4]}"
  for ((i=${#parts[@]}-4; i>4; i--)); do
    groupId="${parts[$i-1]}.${groupId}"
  done
  artifactId="${parts[${#parts[@]}-3]}"
  version="${parts[${#parts[@]}-2]}"

  echo "Deploying g:${groupId} a:${artifactId} v:${version} j:${jar_file}..."
  mvn deploy:deploy-file \
    -Durl="${REPO_URL}" \
    -DrepositoryId="${REPO_ID}" \
    -Dfile="${jar_file}" \
    -DgroupId="${groupId}" \
    -DartifactId="${artifactId}" \
    -Dversion="${version}"
done
