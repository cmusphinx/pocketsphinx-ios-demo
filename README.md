# CMUSphinx iOS build script

This is a shell script to build CMUSphinx libraries for iOS apps.

Tested with:

* Xcode 6

## Requirements

* To build everything:

        ./build_iphone.sh

* To build arm64 libraries:

        ./build_iphone.sh arm64

* To build fat libraries for armv7 and x86_64 (64-bit simulator):

        ./build_iphone.sh armv7 x86_64

