#/bin/bash

if [ $# = 0 ]; then
    echo "ShiftAC's mkcproj 1.2: initialize a C/C++ project."
    echo "Usage: $0 [name]"
fi

pos=$(dirname $(readlink "$0" -f))
res="$pos/../resource/mkcproj"

mkdir "$1"
mkdir "$1/src"
mkdir "$1/bin"
mkdir "$1/temp"
mkdir "$1/test"

echo "# $1" > "$1/README.md"
cat "$res/makefile.src.template" | sed "s/\$1/$1/g" > "$1/src/Makefile"
cat "$res/makefile.template" | sed "s/\$1/$1/g" > "$1/Makefile"
cat "$res/gitignore.template" | sed "s/\$1/$1/g" > "$1/.gitignore"
cp "$res/gitattribute.template" "$1/.gitattribute"

git init "$1" --quiet
