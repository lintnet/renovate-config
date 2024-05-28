#!/usr/bin/env bash

set -eu

while read -r file; do
	file_name="${file#jsonnet/}"
	jsonnet -o "${file_name%net}" "$file"
done < <(ls jsonnet/*.jsonnet)
