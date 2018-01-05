#!/bin/bash
# Get Nordic files, because their SDK license is not permissive.

SDK_VERSION="14.2.0"
SDK_CHECKSUM="17b948a"
SDK_URL="http://www.nordicsemi.com/eng/nordic/download_resource/59011/67/60936953/116085"
SDK_BASENAME="nRF5_SDK_${SDK_VERSION}_${SDK_CHECKSUM}"
SDK_FILE="${SDK_BASENAME}.zip"

WORKING_DIR=".sdk"

mkdir -p $WORKING_DIR

if [ -f $WORKING_DIR/$SDK_FILE ] 
then
	echo "SDK found"
else
	echo "Downloading SDK"
	curl -o $WORKING_DIR/$SDK_FILE $SDK_URL
fi

if ! [ -f $WORKING_DIR/.unzipped ]
then
	echo "Extracting SDK"
	unzip -o -d $WORKING_DIR -q $WORKING_DIR/$SDK_FILE 
	touch $WORKING_DIR/.unzipped
fi

echo "Merging into project"
cp -rf $WORKING_DIR/$SDK_BASENAME/{components,documentation} lib/
cp -rf $WORKING_DIR/$SDK_BASENAME/external/* lib/components/libraries

echo "Bootstrapping complete"
