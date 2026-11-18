#!/bin/bash
export PATH="$HOME/.cargo/bin:/usr/bin:/bin"
export CARGO_TARGET_DIR=$HOME/vc-target
cd /mnt/f/version-control && cargo build --release --offline --color never 2>&1 | tail -4
B=$CARGO_TARGET_DIR/release/version-control
ls -la $B; sha256sum $B
objdump -T $B | grep -o 'GLIBC_[0-9.]*' | sort -uV | tail -3
cp $B /mnt/f/rsa-rs/.vc-release-bin
