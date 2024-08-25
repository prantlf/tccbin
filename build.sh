#!/usr/bin/env bash

set -euo pipefail

TCCDIR=thirdparty/tcc

./configure --debug --prefix=$TCCDIR --bindir=$TCCDIR \
  --extra-cflags=-O3 --config-bcheck=yes --config-backtrace=yes \
  --cpu=i386 --crtprefix=$TCCDIR/lib:/usr/lib/i386-linux-gnu:/usr/lib:lib/i386-linux-gnu:/lib \
  --libpaths=$TCCDIR/lib/tcc:/usr/lib/i386-linux-gnu:/usr/lib:/usr/lib:/lib/i386-linux-gnu:/lib:/usr/local/lib/i386-linux-gnu:/usr/local/lib && \

make
make install
mv $TCCDIR/tcc $TCCDIR/tcc.exe

$TCCDIR/tcc.exe -v -v
$TCCDIR/tcc.exe test.c
./a.out

cp /usr/lib/i386-linux-gnu/libatomic_ops.a $TCCDIR/lib/
cp /usr/lib/i386-linux-gnu/libgc.a $TCCDIR/lib/
