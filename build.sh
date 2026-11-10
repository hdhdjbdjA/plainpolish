#!/usr/bin/env bash
# Assemble the three skills from parts/. Edit parts/, then run: bash build.sh
set -euo pipefail
cd "$(dirname "$0")/parts"; mkdir -p ../pp ../pc ../pw
mk(){ cat head-$1.md; shift; for p in "$@"; do cat $p.md; echo; done; }
mk pp vocab claims sentences sections captions procedures > ../pp/SKILL.md
mk pc clarify procedures vocab claims sentences > ../pc/SKILL.md
mk pw writing vocab claims sentences sections captions procedures > ../pw/SKILL.md
for s in pp pc pw; do cp lexicon.md corpus-wordlist.txt ../$s/; echo "$s: $(wc -c < ../$s/SKILL.md) bytes"; done
