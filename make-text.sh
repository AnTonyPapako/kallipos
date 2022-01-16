#!/bin/bash
for filename in text/ch*.txt; do
   [ -e "$filename" ] || continue
   pandoc --lua-filter=extras.lua "$filename" --to markdown | pandoc --lua-filter=epigraph.lua --to markdown | pandoc --lua-filter=figure.lua --to markdown | pandoc --filter pandoc-fignos --to markdown | pandoc --metadata-file=meta.yml --citeproc --bibliography=bibliography/"$(basename "$filename" .txt).bib" --to latex > latex/"$(basename "$filename" .txt).tex"
done
