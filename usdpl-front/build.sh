#!/bin/bash
if [ -n "$1" ]; then
    if [ "$1" == "--help" ]; then
        echo "Usage:
$0 [decky|crankshaft|<nothing>]"
        exit 0
    elif [ "$1" == "decky" ]; then
        echo "Building WASM module for decky framework"
        wasm-pack build --target web --features decky
    elif [ "$1" == "crankshaft" ]; then
        echo "WARNING: crankshaft support is unimplemented"
        wasm-pack build --target web --features crankshaft
    else
        echo "Unsupported plugin framework \`$1\`"
        exit 1
    fi
else
    echo "WARNING: Building for any plugin framework, which may not work for every framework"
    wasm-pack build --target web
fi

python3 ./scripts/generate_embedded_wasm.py
