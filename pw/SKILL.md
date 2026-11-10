---
name: pw
description: 'Write English manuscript text and figure or table captions in environmental science, water quality and pathogen modelling (QMRA, AMR, E. coli, wastewater, river models, etc.) from notes, results, figures, tables or code supplied by the user, in the plain style of published papers: only facts supplied by the user, no inflated claims, hedging by evidence, gaps marked. Use when the user asks to write or draft a paragraph, section or caption.'
---

# pw: write

Target style: 49 papers (48 before 2022, 1 from 2026 chosen by the author) from ES&T, Water Research, Nature journals, Environment International, STOTEN, Environmental Pollution, IJHEH, ERL, GBC. **Never make text more sophisticated than these papers.**

## Writing

When the user asks to write or draft text or captions from notes, bullet points, results, figures, tables or code. All other sections apply; the text must read like the corpus, not better.
1. **Use only the user's material.** No new facts, numbers, citations, mechanisms or reasons. A missing value is `[?]`; a claim that needs a source but has none gets `[ref?]`. Never fill a gap from general knowledge without flagging it.
2. **Structure by section** (see Sections): Results report numbers with figure references; Discussion compares with the cited work the user gave; Methods follow the Procedures rules.
3. **One paragraph, one point.** First sentence states the point; then evidence; then, if needed, one sentence on what it means.
   **Captions:** write them by the Captions rules from what the figure or table contains (variables, panels, units, statistics, n, data source). Title is a noun phrase without a finding; anything you cannot see or were not told is `[?]`.
4. **Hedge by evidence** (see Claims and hedging): the user's measured results plain, interpretations hedged. Do not add implications the user did not state.
5. **Length:** as asked; otherwise as short as the material allows. No filler opening ("In recent years, ...") or closing summary sentence.
6. **Output:** the text, then "Points for the author to confirm": every `[?]` and `[ref?]`, assumptions made in ordering or linking the points, and claims to check.

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


## Sections

Each section has its own profile; write or polish toward it. When polishing, do not move content between sections; flag it. Per 1,000 words, Results vs Discussion: numbers 15 vs 3, figure references 13 vs 3, citations 2 vs 11, hedges 2 vs 8; Results mostly past tense, Discussion mostly present.

- **Abstract:** background (1–2 sentences), gap or aim, methods in order, results with numbers, validation (deviations honestly), significance (one sentence).
- **Introduction:** problem with numbers, mechanisms, existing models and shortcomings, gap ("has not been fully described", "is limited by the lack of"), "In this study we aim to..." / "Here, we show...".
- **Methods:** value, unit and source of each parameter; assumptions stated ("... were set to zero"); why a process was left out.
- **Results:** topic noun-phrase subheadings, not claims. Open with what was measured and where to see it ("Fig. 2 shows ..."). Numbers, ranges, statistics (ranged from, on average, in total, p < 0.05), reference in brackets after the claim. Present tense for what a figure shows and model output. Few hedges and citations; at most a short explanation ("This is due to ...", "This could be attributed to ...").
- **Discussion:** open with the aim or main finding; novelty only as "To our knowledge, ..." and only if true. Compare each finding with cited work ("is in agreement with", "is consistent with", "In contrast, X et al. found ...") and say why results differ. Interpretation hedged by evidence. Limitations ("However, it should be noted that ..."). End with implications and specific research needs (should, we recommend, "Further research is needed on ...").
- **Conclusions:** short; no citations, no figure references, few numbers; findings, then use ("Our model can be used for ...").


## Captions

When polishing, minimal edits. Flag missing information; never invent it.
- **Title = noun phrase, no verb, no finding** (178 of 179 in the corpus): "Spatial distribution of E. coli concentrations in river water.", not "E. coli increases downstream." Starts: Distribution of, Comparison of, Relative contribution of, Map of, Modelled ...
- **Figures:** then short sentences on how to read it (panels, symbols, lines, statistics, n), not what it means. Verbs: show, represent, indicate, denote. "Error bars represent the standard deviation (n = 3)." Panels (a), (b), used consistently.
- Define every abbreviation, unit and symbol needed to read it alone; give the data source if not the authors' own.
- **Tables:** title only, noun phrase, units in brackets: "Removal of E. coli in each treatment step (log10 units)". Explanations, abbreviations and "nd, not detected" go in footnotes (a, b).
- Keep the user's numbering style (Fig. 1. / Figure 1. / Fig. 1 |).


## Procedures

For a procedure of 3+ steps with a sentence of 2+ operations, an undefined term, one thing under several names, or a "this/these" pointing back more than one sentence:
1. Aim first; mark steps (First, Next, Last).
2. One operation per sentence (what, to what, with which input); reason in its own sentence.
3. Define a term at first use; one word per thing (share, not share/fraction/value).
4. State the result plainly ("The result is a calibration curve: ...").
5. Exceptions last, one per sentence, starting with the case ("Where no sample was left, ...").
6. No nested brackets; repeat the noun instead of a distant "this".
7. Keep every number, unit, source and term.


