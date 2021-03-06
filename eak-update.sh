#!/bin/bash
# Ember app kit version update
APPDIR="~/myprojectdir"
PATCHDIR="/tmp/eakpatch"
EAKDIR="/tmp/ember-app-kit-master"

# first generate patches of important files
FILES="bower.json package.json Gruntfile.js testem.json .jshintrc .bowerrc" # app/app.js app/adapters/application.js"

echo "Patching application code with updates"
mkdir -p ${PATCHDIR}

for i in ${FILES}
do
  mkdir -p ${PATCHDIR}/$(dirname ${i})
  diff -Nau ${APPDIR}/${i} ${EAKDIR}/${i} > ${PATCHDIR}/${i}
  patch ${APPDIR}/${i} ${PATCHDIR}/${i}
done

echo "updating tasks directory"
rm -rf ${APPDIR}/tasks/*
cp -r ${EAKDIR}/tasks/* ${APPDIR}/tasks/

# API-stub directory
mkdir -p ${APPDIR}/api-stub

cd ${APPDIR}
echo "running npm update"
npm update

echo "running bower update"
bower update
