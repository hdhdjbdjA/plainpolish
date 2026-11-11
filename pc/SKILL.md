---
name: pc
description: 'Clarify English manuscript text in environmental science, water quality and pathogen modelling (QMRA, AMR, E. coli, wastewater, river models, etc.) that readers cannot follow: split, merge and reorder sentences so each is understood on first reading, without adding facts or claims, in the plain style of published papers. Use when the user says a text is unclear, confusing or hard to understand, or asks to clarify it.'
---

# pc: clarify

Target style: 49 papers (48 before 2022, 1 from 2026 chosen by the author) from ES&T, Water Research, Nature journals, Environment International, STOTEN, Environmental Pollution, IJHEH, ERL, GBC. **Never make text more sophisticated than these papers.**

## Workflow

1. Rewrite for understanding on first reading (Clarify and Procedures rules). Keep every fact, number, unit, citation and technical term; add no facts, claims or reasons.
2. Output the rewritten text. No change table. Then "Points for the author to confirm" (in the user's language): assumptions to check, who did each step, numbers that need a source, anything you had to guess. No heading such as "Polished text" above the text. In Microsoft Word (the Claude add-in, where the text is in the open document), edit the document directly and reply with only "Points for the author to confirm"; do not repeat the text in the reply.

## Clarify

When the user says the text is unclear, or asks to clarify. Sentences may be split, merged and reordered; the Procedures rules apply. No facts, claims or reasons added.
1. Known before new: what the source or data show, then what was done with it.
2. Concrete subjects (samples, sites, plants), not abstractions (share of a share, part).
3. One reference group per sentence ("out of what" fixed); a new group starts a new sentence.
4. After a number from a source, say in plain words what it means ("In other words, 33% of the plants are upgraded.").
5. Name the actual years or objects, not labels ("2018 and 2020", not "the sampling year").
6. Own assumptions start with "We assumed"; credit each step to the cited method or "we"; if unclear, ask.
7. Real numbers where they make a rule obvious; no made-up examples in the text.
8. Describe what happens in the data instead of a rule for cases that never occur, only if the user or code confirms it.
9. Each sentence must be understood on first reading.

Example: "The share of positive samples was reduced by the same fraction as in the reference values." → "Across all rivers, 20% of the samples were positive in 2018 and 8% in 2020. At each site, we reduced the positive samples of 2018 by the same relative amount."


## Procedures

For a procedure of 3+ steps with a sentence of 2+ operations, an undefined term, one thing under several names, or a "this/these" pointing back more than one sentence:
1. Aim first; mark steps (First, Next, Last).
2. One operation per sentence (what, to what, with which input); reason in its own sentence.
3. Define a term at first use; one word per thing (share, not share/fraction/value).
4. State the result plainly ("The result is a calibration curve: ...").
5. Exceptions last, one per sentence, starting with the case ("Where no sample was left, ...").
6. No nested brackets; repeat the noun instead of a distant "this".
7. Keep every number, unit, source and term.


## Vocabulary

Plain verbs: show, find, estimate, calculate, simulate, use, apply, account for, compare, assume, indicate, suggest.

- Never introduce a word that is rare in the corpus; replace rare general words with clearly more common ones. Check `grep -w "word" corpus-wordlist.txt` ("word count"; only words with ≥3 uses in ≥8 papers). Rare = missing or <20. E.g. `bound`/`constrain` (verbs), `track`, `restricted`, `penetration` are missing; use account for (96), provide (113), limit (63), spread (93).
- **Never change technical terms**, even if missing: biological terms, abbreviations, model and parameter names (conjugation coefficients, decay rate), statistics, methods. If a specialist could feel the meaning changed, or if unsure, keep it.
- Keep the user's spelling (faecal/fecal, modelling/modeling). More phrases and domain terms: `lexicon.md`.

**Banned:** delve into → examine; tapestry, multifaceted, pivotal → delete or state the content; leverage, harness, utilize → use; myriad, plethora → many; groundbreaking, unprecedented → first (if true) or delete; holistic → overall or delete; in stark contrast → in contrast / whereas; dramatic(ally), pronounced (change) → give the value; eradicate → eliminate; emerge as → is / becomes; actionable / valuable insights → say what it can be used for.

**Restricted** (do not add; if kept, once per manuscript with a concrete meaning): robust (statistical only), novel, comprehensive (complete scope only), crucial, critical, key, highlight, underscore, notably, importantly, substantial, paramount, shed light on, paves the way. Moreover or Furthermore, not both, not in every paragraph.


## Claims and hedging (most important)

- **Never inflate** (may/suggest never become demonstrate/clearly show). Never replace a number with an adjective or invent a number.
- Hedge by the evidence in each sentence, not by frequency. Measured or computed results: plain, no hedge (an over-hedged one may lose it). Inferences, causes, extrapolation, predictions: may, could, suggest, is likely. Inference written as fact: flag it, do not add the hedge yourself.
- Self-assessment plain (reasonable / crude / does not perform well), neither inflated nor belittling. State the range of validity.
- Limitation order: what, why, direction of bias, what would improve it. "The model may underestimate oocyst losses, because reservoirs are not yet included."


## Sentences

- Plain connectives (However, Therefore, Thus, In addition, In contrast, Here, To this end), not stacked or in every sentence.
- Present for model structure and general facts; past for operations and findings. "We" for choices and assumptions; give purpose and reason in Methods.
- No dashes for asides, no rhetorical questions, no adjective triplets. References in brackets: (Fig. 2a–c), (Table S4).
- Target level: "These results suggest that reducing antibiotic use alone is likely insufficient for reversing resistance." "Oocyst excretion rates are variable and uncertain."


