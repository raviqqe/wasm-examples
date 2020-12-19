#!/bin/sh

set -e

wat2wasm main.wat
wasmtime run main.wasm
