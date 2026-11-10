---
name: plainpolish
description: 'Polish English manuscript paragraphs in environmental science, water quality and pathogen modelling (QMRA, AMR, E. coli, wastewater, river models, etc.). Minimal edits, plain vocabulary checked against a corpus of published papers, no inflated claims, adequate hedging. Use when the user asks to polish, proofread or improve English academic text, or says a text is unclear or hard to understand (clarify mode).'
---

# plainpolish

Target style: 49 papers (48 before 2022, 1 from 2026 chosen by the author) from ES&T, Water Research, Nature journals, Environment International, STOTEN, Environmental Pollution, IJHEH, ERL, GBC. **Never make text more sophisticated than these papers.**

## 0. Workflow

1. Minimal edits: grammar, cohesion, redundancy, ambiguity, tense, articles. Keep meaning, terminology, numbers.
2. Output the full polished text. No change table, no explanation of changes. Then "Points for the author to confirm" (in the user's language): content, logic or evidence questions (inference written as fact, unclear term or number, citation placement, content in the wrong section). List only; omit if none.
3. Restructure only on request, for multi-step procedures (section 6) or in clarify mode (section 7). Otherwise flag hard-to-follow sentences.

## 1. Vocabulary

Plain verbs: show, find, estimate, calculate, simulate, use, apply, account for, compare, assume, indicate, suggest.

- Never introduce a word that is rare in the corpus; replace rare general words with clearly more common ones. Check `grep -w "word" corpus-wordlist.txt` ("word count"; only words with ≥3 uses in ≥8 papers). Rare = missing or <20. E.g. `bound`/`constrain` (verbs), `track`, `restricted`, `penetration` are missing; use account for (96), provide (113), limit (63), spread (93).
- **Never change technical terms**, even if missing: biological terms, abbreviations, model and parameter names (conjugation coefficients, decay rate), statistics, methods. If a specialist could feel the meaning changed, or if unsure, keep it.
- Keep the user's spelling (faecal/fecal, modelling/modeling). More phrases and domain terms: `lexicon.md`.

**Banned:** delve into → examine; tapestry, multifaceted, pivotal → delete or state the content; leverage, harness, utilize → use; myriad, plethora → many; groundbreaking, unprecedented → first (if true) or delete; holistic → overall or delete; in stark contrast → in contrast / whereas; dramatic(ally), pronounced (change) → give the value; eradicate → eliminate; emerge as → is / becomes; actionable / valuable insights → say what it can be used for.

**Restricted** (do not add; if kept, once per manuscript with a concrete meaning): robust (statistical only), novel, comprehensive (complete scope only), crucial, critical, key, highlight, underscore, notably, importantly, substantial, paramount, shed light on, paves the way. Moreover or Furthermore, not both, not in every paragraph.

## 2. Claims and hedging (most important)

- **Never inflate** (may/suggest never become demonstrate/clearly show). Never replace a number with an adjective or invent a number.
- Hedge by the evidence in each sentence, not by frequency. Measured or computed results: plain, no hedge (an over-hedged one may lose it). Inferences, causes, extrapolation, predictions: may, could, suggest, is likely. Inference written as fact: flag it, do not add the hedge yourself.
- Self-assessment plain (reasonable / crude / does not perform well), neither inflated nor belittling. State the range of validity.
- Limitation order: what, why, direction of bias, what would improve it. "The model may underestimate oocyst losses, because reservoirs are not yet included."

## 3. Sentences

- Plain connectives (However, Therefore, Thus, In addition, In contrast, Here, To this end), not stacked or in every sentence.
- Present for model structure and general facts; past for operations and findings. "We" for choices and assumptions; give purpose and reason in Methods.
- No dashes for asides, no rhetorical questions, no adjective triplets. References in brackets: (Fig. 2a–c), (Table S4).
- Target level: "These results suggest that reducing antibiotic use alone is likely insufficient for reversing resistance." "Oocyst excretion rates are variable and uncertain."

## 4. Sections

Polish each section toward its own profile; do not move content, flag it. Per 1,000 words, Results vs Discussion: numbers 15 vs 3, figure references 13 vs 3, citations 2 vs 11, hedges 2 vs 8; Results mostly past tense, Discussion mostly present.

- **Abstract:** background (1–2 sentences), gap or aim, methods in order, results with numbers, validation (deviations honestly), significance (one sentence).
- **Introduction:** problem with numbers, mechanisms, existing models and shortcomings, gap ("has not been fully described", "is limited by the lack of"), "In this study we aim to..." / "Here, we show...".
- **Methods:** value, unit and source of each parameter; assumptions stated ("... were set to zero"); why a process was left out.
- **Results:** topic noun-phrase subheadings, not claims. Open with what was measured and where to see it ("Fig. 2 shows ..."). Numbers, ranges, statistics (ranged from, on average, in total, p < 0.05), reference in brackets after the claim. Present tense for what a figure shows and model output. Few hedges and citations; at most a short explanation ("This is due to ...", "This could be attributed to ...").
- **Discussion:** open with the aim or main finding; novelty only as "To our knowledge, ..." and only if true. Compare each finding with cited work ("is in agreement with", "is consistent with", "In contrast, X et al. found ...") and say why results differ. Interpretation hedged by evidence. Limitations ("However, it should be noted that ..."). End with implications and specific research needs (should, we recommend, "Further research is needed on ...").
- **Conclusions:** short; no citations, no figure references, few numbers; findings, then use ("Our model can be used for ...").

## 5. Captions

Same minimal edits; flag missing information, never invent it.
- **Title = noun phrase, no verb, no finding** (178 of 179 in the corpus): "Spatial distribution of E. coli concentrations in river water.", not "E. coli increases downstream." Starts: Distribution of, Comparison of, Relative contribution of, Map of, Modelled ...
- **Figures:** then short sentences on how to read it (panels, symbols, lines, statistics, n), not what it means. Verbs: show, represent, indicate, denote. "Error bars represent the standard deviation (n = 3)." Panels (a), (b), used consistently.
- Define every abbreviation, unit and symbol needed to read it alone; give the data source if not the authors' own.
- **Tables:** title only, noun phrase, units in brackets: "Removal of E. coli in each treatment step (log10 units)". Explanations, abbreviations and "nd, not detected" go in footnotes (a, b).
- Keep the user's numbering style (Fig. 1. / Figure 1. / Fig. 1 |).

## 6. Procedures (automatic)

For a procedure of 3+ steps with a sentence of 2+ operations, an undefined term, one thing under several names, or a "this/these" pointing back more than one sentence:
1. Aim first; mark steps (First, Next, Last).
2. One operation per sentence (what, to what, with which input); reason in its own sentence.
3. Define a term at first use; one word per thing (share, not share/fraction/value).
4. State the result plainly ("The result is a calibration curve: ...").
5. Exceptions last, one per sentence, starting with the case ("Where no sample was left, ...").
6. No nested brackets; repeat the noun instead of a distant "this".
7. Keep every number, unit, source and term.

## 7. Clarify mode

When the user says the text is unclear, or asks to clarify. Sentences may be split, merged and reordered; section 6 applies. No facts, claims or reasons added.
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
