#!/usr/bin/env bash
# Usage (from anywhere): _utilities/new-week.sh 02 functions "Scripts & Functions" 2026-04-23
set -euo pipefail
cd "$(dirname "$0")/.."   # run from project root
n=$1; slug=$2; topic=$3; date=${4:-YYYY-MM-DD}
dir="$n-$slug"
[ -e "$dir" ] && { echo "$dir exists"; exit 1; }
cp -r _utilities/week-template "$dir"
sed -i.bak "s/TOPIC/$topic/; s/Week N/Week $((10#$n))/; s/Practical N/Practical $((10#$n))/; s/YYYY-MM-DD/$date/" "$dir"/*.qmd
rm "$dir"/*.bak
cat >> _variables.yml <<YML
  w$n:
    number: $((10#$n))
    date: "$date"
    topic: "$topic"
    folder: "$dir"
    references: ""
YML
echo "Created $dir and added w$n to _variables.yml"
