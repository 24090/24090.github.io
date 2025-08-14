#! /bin/bash
cd "${BASH_SOURCE%gen.sh}/.."

rsync -a --exclude '*.md' src/ site/

for file in `find src -type f`; do
    if [[ $file == *.md ]]; then
        file=${file#src/}
        file=${file%.md}
        echo "converting $file"
        pandoc \
            -s \
            --template gen/template.html \
            -i src/$file.md \
            -o site/$file.html \
            --mathml
    fi
done