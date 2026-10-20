# plainpolish

A Claude skill for polishing English academic text in environmental science, water quality and pathogen modelling (QMRA, AMR, *E. coli*, wastewater, river models).

It aims for the plain, restrained style of published papers rather than a more "sophisticated" one:

- **Minimal edits.** Grammar, cohesion, redundancy, tense and articles only. Meaning, terminology and numbers stay as they are.
- **Corpus-checked vocabulary.** General words that are rare in a corpus of 43 papers published before 2022 are replaced by common ones; technical terms are never changed.
- **No inflated claims.** Hedging follows the strength of the evidence in each sentence; inferences are not upgraded to facts.
- **Banned and restricted words.** A short list of words typical of AI-written text (for example *delve*, *leverage*, *holistic*) is banned, and words such as *robust* or *underscore* are not added by default.
- **Short review notes.** After the polished paragraph, the skill lists questions about content, logic or evidence for the author to confirm. It does not change the text for them.

## Install

Copy the `plainpolish/` folder into your skills directory, for example `~/.claude/skills/`, and start a new session. Then ask Claude to polish a paragraph, or run `/plainpolish`.

## Files

| File | Purpose |
|---|---|
| `plainpolish/SKILL.md` | The rules (loaded on every use, about 2,200 tokens) |
| `plainpolish/lexicon.md` | Domain terms and common verbs and phrases (read when needed) |
| `plainpolish/corpus-wordlist.txt` | Word frequencies ("word count") used for the vocabulary check; looked up with `grep`, not read in full |

## About the corpus

The word list was built from the text of 43 published research papers (ES&T, Water Research, Nature journals, Environment International, STOTEN, Environmental Pollution; all published in 2021 or earlier). Only word counts are included here. No paper text is distributed. Names, affiliations and publisher boilerplate were removed from the list.

## Limits

- The corpus is small (43 papers), so the list is a guide, not a standard.
- The rules were tuned for environmental science and may suit other fields less well.
- Always read the polished text yourself; the skill does not check facts.

## License

MIT, see `LICENSE`.
