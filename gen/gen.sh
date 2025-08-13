#! /bin/bash
rm site/*.html
for file in `ls src/*.md`
do
    echo $file
    file=${file#src/}
    file=${file%.md}
    echo $file
    pandoc \
        -s \
        --template gen/template.html \
        -i src/$file.md \
        -o site/$file.html
done