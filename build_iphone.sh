#!/bin/sh

SCRATCH="scratch"
DEST=`pwd`/"bin"

ARCHS="armv7s armv7 x86_64"

DEPLOYMENT_TARGET="6.0"

if [ "$*" ]
then
	ARCHS="$*"
fi

CWD=`pwd`

for ARCH in $ARCHS
do
	SPHINXBASE_DIR=`pwd`/../sphinxbase/bin/$ARCH
	echo "building $ARCH..."
	mkdir -p "$SCRATCH/$ARCH"
	cd "$SCRATCH/$ARCH"

	if [ "$ARCH" = "i386" -o "$ARCH" = "x86_64" ]
	then
	    PLATFORM="iPhoneSimulator"
	    IOS_CFLAGS="-arch $ARCH -mios-simulator-version-min=$DEPLOYMENT_TARGET"
	else
	    PLATFORM="iPhoneOS"
	    IOS_CFLAGS="-arch $ARCH -mios-version-min=$DEPLOYMENT_TARGET"
	fi	
	export DEVELOPER=`xcode-select --print-path`
	export DEVROOT="${DEVELOPER}/Platforms/${PLATFORM}.platform/Developer"
	export SDKROOT="${DEVROOT}/SDKs/${PLATFORM}${IPHONE_SDK}.sdk"
	export CC=`xcrun -find gcc`
	export LD=`xcrun -find ld`
	export CFLAGS="-O3 ${IOS_CFLAGS} -isysroot ${SDKROOT}"
	export LDFLAGS="${IOS_CFLAGS} -isysroot ${SDKROOT}"
	export CPPFLAGS="${CFLAGS}"

	$CWD/configure \
	    --host="${ARCH}-apple-darwin" \
	    --prefix="$DEST/$ARCH" \
	    --without-lapack \
	    --without-python \
	    --with-sphinxbase="$SPHINXBASE_DIR" \
	|| exit 1

	make -j3 install $EXPORT || exit 1
	cd $CWD
done

echo Done
