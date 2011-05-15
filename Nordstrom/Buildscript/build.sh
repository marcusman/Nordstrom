#!/bin/sh



# build.sh
# Jenkins/Hudson Build script 
#
# Created by Mark Allen on 5/14/11.
# Copyright 2011 Nordstrom Inc. All rights reserved.
# updating for .ipa file.


function failed()
{
    echo "Failed: $@" >&2
    exit 1
}
 
set -ex


# Mark
PROJDIR=${WORKSPACE}
PROJECT_BUILDDIR="${PROJDIR}/build/"
BUILD_HISTORY_DIR=$WORKSPACE/output

DEVELOPER_NAME="iPhone Distribution: Nordstrom, Inc."
APPLICATION_NAME="Nordstrom"  #At some point the application name should be something else.
NEWFILE_NAME="Nordstrom"




export OUTPUT=$WORKSPACE/output
rm -rf $OUTPUT
mkdir -p $OUTPUT
PROFILE_HOME=~/Library/MobileDevice/Provisioning\ Profiles/
#PROFILE_HOME=/Users/remote/Library/MobileDevice/Provisioning\ Profiles/
#PROFILE_HOME=/Users/remote/HudsonBuild/test/
KEYCHAIN=~/Library/Keychains/login.keychain
# removing MSearch3 for new build server
# . "$WORKSPACE/MSearch3/Buildscript/build.config"
. "$WORKSPACE/Nordstrom/Buildscript/build.config"

#try commenting this out for new buildserver
[ -d "$PROFILE_HOME" ] || mkdir -p "$PROFILE_HOME"
# security unlock -p $PASSWORD

echo "Profile home ="
echo $PROFILE_HOME

#real name of project 
#cd $WORKSPACE/MSearch3;
cd $WORKSPACE;

agvtool new-version -all $SVN_REVISION


REV=`/usr/bin/svnversion -nc ${PROJECT_DIR} | /usr/bin/sed -e 's/^[^:]*://;s/[A-Za-z]//'`
#echo "BUILD_NUMBER = $REV" > ${PROJECT_DIR}/buildnumber.xcconfig
#/usr/libexec/PlistBuddy -c "Set :CFBundleVersion $REV" "$WORKSPACE/MSearch3"/MSearch3-Info.plist
echo "BUILD_NUMBER = $REV" > ${PROJDIR}/buildnumber.xcconfig
/usr/libexec/PlistBuddy -c "Set :CFBundleVersion $REV" "$WORKSPACE/Nordstrom"/Nordstrom-Info.plist



echo "This is just Jenkins Testing output should delete later."


for sdk in $SDKS; do
for config in $CONFIGURATIONS; do
provision=$(eval echo \$`echo Provision$config`)
        # cert="$WORKSPACE/MSearch3/buildscript/$provision"
        cert="$WORKSPACE/Nordstrom/Buildscript/$provision"
		archive="$OUTPUT/$JOB_NAME-$SVN_REVISION-$config.zip";
        [ -f "$cert" ] && cp "$cert" "$PROFILE_HOME"
        #cd $WORKSPACE/MSearch3
        cd $WORKSPACE
		
        xcodebuild -configuration $config -sdk $sdk clean;
        xcodebuild -configuration $config -sdk $sdk || failed build;
        
        #cd tmp/Builds/$config-iphoneos;   #had to modify to match where I place my temporary builds
        cd build/$config-iphoneos;

        if [ $config == "Release" ]; then
            zip -r -T -y "$archive" *.app* || failed zip
            zip -j -T "$archive" "$WORKSPACE/icon.png" || failed icon
        else
            ## zip -r -T -y "$archive" *.app || failed zip
            ## zip -j -T "$archive" "$cert" || failed cert
             /usr/bin/xcrun -sdk iphoneos PackageApplication -v "${PROJECT_BUILDDIR}$config-iphoneos/${APPLICATION_NAME}.app" -o "${BUILD_HISTORY_DIR}/${APPLICATION_NAME}.ipa" --sign "${DEVELOPER_NAME}" --embed "${cert}"
            
            #copy plist to output directory
            cp $WORKSPACE/Nordstrom/Buildscript/$NEWFILE_NAME.plist $OUTPUT   
            mv "$OUTPUT/$APPLICATION_NAME.ipa" "$OUTPUT/$NEWFILE_NAME.ipa"
        fi
done
done

