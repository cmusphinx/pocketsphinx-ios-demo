# CMUSphinx iOS build script

This is a shell script to build CMUSphinx libraries for iOS apps.

Tested with Xcode 6

## Usage

You need to build both sphinxbase and pocketsphinx. First clone both
from github, then run autogen.sh inside both in order to create
configure. You need to have autotools installed for that. Then copy
build script in sphinxbase folder and in pocketsphinx folder. Change
current folder to sphinxbase and run build script from this folder. Then
go to pocketsphinx and run build there.

Script takes a list of architectures to build as an argument.

To build everything:

        ./build_iphone.sh

To build arm64 libraries:

        ./build_iphone.sh arm64

To build fat libraries for armv7 and x86_64 (64-bit simulator):

        ./build_iphone.sh armv7 x86_64
