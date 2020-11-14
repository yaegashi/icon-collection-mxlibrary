#!/bin/bash

set -e

outdir=${1-out}

mkdir -p "$outdir"

git clone --depth 1 https://github.com/benc-uk/icon-collection

for i in azure-icons azure-docs azure-cds azure-patterns logos other; do
    outfile="$outdir/$i.xml"
    echo "Generating mxlibrary $outfile"
    node svg2mxlibrary -o $outfile icon-collection/$i/*.svg
done

rm -rf icon-collection
