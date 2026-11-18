#!/bin/bash
export PATH="$HOME/.cargo/bin:/usr/bin:/bin"
export CARGO_TARGET_DIR=$HOME/vc-target-musl
rustup target list --installed
which musl-gcc || echo "no musl-gcc"
rustup target add x86_64-unknown-linux-musl 2>&1 | tail -2
cd /mnt/f/version-control && cargo build --release --target x86_64-unknown-linux-musl --offline --color never 2>&1 | tail -15
ls -la $CARGO_TARGET_DIR/x86_64-unknown-linux-musl/release/version-control
