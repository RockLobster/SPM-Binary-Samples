#!/bin/bash -l
set -eux pipefail

ARCHIVE_DIR="$(pwd)/archive"
OUTPUT_DIR="$(pwd)/Binaries"

buildBinary() {
    SCHEME_NAME=$1
    PLATFORM=$2

    xcodebuild archive \
        -quiet \
        -scheme "$SCHEME_NAME" \
        -destination "generic/platform=$PLATFORM" \
        -archivePath "$ARCHIVE_DIR/$SCHEME_NAME/$PLATFORM" \
        SKIP_INSTALL=NO \
        BUILD_LIBRARY_FOR_DISTRIBUTION=YES
}

createXCFramework() {
    SCHEME_NAME=$1

    pushd Sources
        buildBinary $SCHEME_NAME "iOS"
        buildBinary $SCHEME_NAME "iOS Simulator"
    popd

    pushd "$ARCHIVE_DIR"
        xcodebuild -create-xcframework \
            -framework "$SCHEME_NAME/iOS.xcarchive/Products/Library/Frameworks/$SCHEME_NAME.framework" \
            -framework "$SCHEME_NAME/iOS Simulator.xcarchive/Products/Library/Frameworks/$SCHEME_NAME.framework" \
            -output "$SCHEME_NAME.xcframework"
    popd
}

main() {
    # Step 1: Create new XCFrameworks
    rm -rf $ARCHIVE_DIR
    mkdir $ARCHIVE_DIR
    createXCFramework BinarySampleHelloWorldObjC
    createXCFramework BinarySampleHelloWorldSwift

    #Step 2: Move them to the Binaries Folder
    rm -rf $OUTPUT_DIR
    mkdir $OUTPUT_DIR
    cp -R "$ARCHIVE_DIR/BinarySampleHelloWorldObjC.xcframework" $OUTPUT_DIR
    cp -R "$ARCHIVE_DIR/BinarySampleHelloWorldSwift.xcframework" $OUTPUT_DIR 
}

main