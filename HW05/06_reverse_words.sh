#!/usr/bin/env bash
read -r -p "Enter a sentence: " sentence
read -r -a words <<< "$sentence"
result=""
for (( i=${#words[@]}-1; i>=0; i-- )); do
    result+="${words[i]} "
done
echo "${result% }"