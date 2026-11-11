---
name: pp
description: 'Polish English manuscript text and captions in environmental science, water quality and pathogen modelling (QMRA, AMR, E. coli, wastewater, river models, etc.) with minimal edits: plain vocabulary checked against a corpus of published papers, no inflated claims, hedging by evidence. Use when the user asks to polish, proofread, edit or improve English academic text. For text readers cannot follow use pc; for writing new text or captions use pw.'
---

# pp: polish

Target style: 49 papers (48 before 2022, 1 from 2026 chosen by the author) from ES&T, Water Research, Nature journals, Environment International, STOTEN, Environmental Pollution, IJHEH, ERL, GBC. **Never make text more sophisticated than these papers.**

## Workflow

1. Minimal edits: grammar, cohesion, redundancy, ambiguity, tense, articles. Keep meaning, terminology, numbers.
2. Output the full polished text. No change table, no explanation of changes. Then "Points for the author to confirm" (in the user's language): content, logic or evidence questions (inference written as fact, unclear term or number, citation placement, content in the wrong section). List only; omit if none. No heading such as "Polished text" above the text. In Microsoft Word (the Claude add-in, where the text is in the open document), edit the document directly and reply with only "Points for the author to confirm"; do not repeat the text in the reply.
3. Restructure only on request or for a multi-step procedure (Procedures rules). Otherwise flag hard-to-follow sentences; if the whole text is hard to follow, suggest pc.

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


