---
name: plainpolish
description: 'Polish English manuscript paragraphs in environmental science, water quality and pathogen modelling (QMRA, AMR, E. coli, wastewater, river models, etc.). Minimal edits, plain vocabulary checked against a corpus of published papers, no inflated claims, adequate hedging. Use when the user asks to polish, proofread or improve English academic text, or says a text is unclear or hard to understand (clarify mode).'
---

# plainpolish

Target style: 49 papers, 48 from before 2022 and 1 from 2026 chosen by the author (ES&T, Water Research, Nature journals, Environment International, STOTEN, Environmental Pollution, IJHEH, ERL, GBC). This level is enough. **Do not make text more sophisticated than these papers.**

## 0. Workflow

1. Minimal edits: fix only grammar, cohesion, redundancy, ambiguity, tense, articles. Keep meaning, terminology, numbers.
2. Keep words that are common in the corpus. Replace rare ones (section 1). A replacement must not be harder than the original.
3. Output the full polished paragraph. No change table, no explanation of changes. Then "Points for the author to confirm" (in the user's language): content, logic or evidence questions (inference written as fact, unclear term or number, citation placement). List only, do not change the text for them. Omit if none.
4. Restructure sentences only on request for a major rewrite, or under section 7 or 8.
5. Clarify mode (section 8) replaces minimal edits when the user says the text is unclear, confusing, hard to understand, or asks to clarify. In polish mode, list section 8 problems under "Points for the author to confirm" instead of fixing them.

## 1. Vocabulary

Prefer plain verbs: show, find, estimate, calculate, simulate, use, apply, account for, compare, assume, indicate, suggest.

- Do not introduce a word that is rare in the corpus. Replace a rare non-technical word in the user's text with a clearly more common one.
- Check `corpus-wordlist.txt` ("word count"; listed only if ≥3 uses in ≥8 of 49 papers; missing = rare): `grep -w "word" corpus-wordlist.txt`. Rare = missing or <20 uses. Examples: `bound`/`constrain` as verbs, `track`, `restricted`, `penetration` are missing; use account for (96), provide (113), limit (63), spread (93). Rare words are the main source of "AI voice".
- **Never change technical terms**, even if missing from the list: biological terms (plasmid, conjugation, biofilm), abbreviations (ESBL, WWTP), model and parameter names (conjugation coefficients, decay rate, carrying capacity), statistics and methods. Test: would a specialist feel the meaning changed? If unsure, keep. Replace only general words (verbs, adjectives, adverbs, connectives).
- Keep the user's spelling (faecal/fecal, modelling/modeling).

**A. Banned** (use the replacement):

| Banned | Use |
|---|---|
| delve into | examine / study |
| tapestry, multifaceted, pivotal | delete, or state the content |
| leverage, harness, utilize | use |
| myriad, plethora | many |
| groundbreaking, unprecedented | first (only if true) or delete |
| holistic | overall / full, or delete |
| in stark contrast, contrasting sharply | in contrast / whereas |
| dramatic(ally), pronounced (change) | give the fold change or value |
| eradicate | eliminate / stop |
| emerge as | is / becomes |
| actionable / valuable insights | state what it can be used for |

**B. Restricted:** robust, novel, comprehensive, crucial, critical, key, highlight, underscore, notably, importantly, substantial, paramount, shed light on, paves the way. Do not add them by default (`robust`, `highlight`, `underscore`, `notably` almost never occur before 2022). If kept, at most once per manuscript with a concrete meaning: `comprehensive` only for complete scope, `robust` only for statistical robustness. Use either `Moreover` or `Furthermore`, not in every paragraph.

Common verbs, phrases and domain terms: `lexicon.md` (read when needed).

## 2. Claims and hedging (most important)

- **Never inflate** (may/suggest/likely never become demonstrate/clearly show). Do not replace a number with an adjective; never invent a number.
- Judge hedging per sentence by evidence, not by frequency:
  - Directly computed or measured results: plain statement, no hedge. Over-hedged ones may lose the hedge.
  - Inferences, causes, extrapolation, predictions, recommendations: hedged (may, could, suggest, is likely, appear to).
  - Inference written as fact: do not add a hedge yourself; list it under "Points for the author to confirm".
  - Do not add may everywhere.
- Describe self-assessment and limitations plainly (reasonable / quite large / crude / does not perform well), neither inflated nor belittling.
- State the range of validity ("should not be overinterpreted").

## 3. Limitations

Order: what it is, why, which direction it may bias the result, what data or method would improve it. Example: "The model may be underestimating oocyst losses, particularly because dams, lakes and reservoirs are not yet included." "It should be noted that..." may introduce a caveat.

## 4. Sentences and connectives

- Plain connectives (However, Therefore, Thus, Indeed, In addition, Nevertheless, In contrast, Here, To this end), never stacked or in every sentence.
- Methods: give purpose and reason ("..., to exclude data from resistant isolates"; "We therefore choose..."); "we" for choices and assumptions.
- Tense: present for model structure and general facts; past for operations and results.
- No dashes for asides, no rhetorical questions, no triplets of adjectives. Figure and table references in brackets: (Fig. 2a–c), (Table S4).

## 5. Section structure

- **Abstract:** 1–2 sentences background, gap or aim, methods in order ("To this end, we first... Next..."), results with numbers, validation (state deviations honestly), one sentence on significance.
- **Introduction:** problem with numbers, mechanisms, existing models and shortcomings, gap ("has not been fully described", "is limited by the lack of"), then "In this study we aim to..." / "Here, we show...".
- **Methods:** value, unit and source of each parameter; state assumptions and simplifications ("... were set to zero"); say why a process was left out.
- **Results:** numbers first; explain with "This is primarily due to...", "This could be attributed to...".
- **Discussion:** main findings versus earlier work, limitations (section 3), improvements and applications; should / we recommend.

## 6. Calibration (target difficulty)

- "These results suggest that reducing antibiotic use alone is likely insufficient for reversing resistance."
- "For this reason, conjugation was chosen as the focus of the current study."
- "Oocyst excretion rates are variable and uncertain."

## 7. Readability rewrite (procedures, automatic)

Applies to a paragraph describing a procedure of 3+ steps (usually Methods) that has a sentence with 2+ operations, an undefined term (factor, adjusted value), one thing under several names, or a "this/these" pointing back more than one sentence. Also when the user asks for clearer text. Elsewhere do not split sentences for length; flag under "Points for the author to confirm".

1. Open with the aim in one sentence; mark steps (First, Next, Last).
2. One operation per sentence: what, to what, with which input. Reason in its own short sentence.
3. Define a term at first use; one word per thing (share, not share/fraction/value).
4. State the result in one plain sentence ("The result is a calibration curve: ...").
5. Exceptions last, one per sentence, starting with the case ("Where no sample was left, ...").
6. No nested brackets; repeat the noun instead of a distant "this/that".
7. Keep every number, unit, source and technical term unchanged.

## 8. Clarify mode

For text the reader cannot follow. Sentences may be split, merged and reordered, and section 7 applies. Facts, numbers, citations and technical terms stay unchanged; no claims or reasons are added.

1. Known before new: first what the source or data show, then what was done with it ("Across all rivers, ... We assumed the same at each site.").
2. Concrete subjects: the things counted (samples, sites, plants, cells), not abstractions (gap, share of a share, part).
3. One reference group per sentence: keep "out of what" fixed (all samples, or only positive samples). When it changes, start a new sentence.
4. Translate before applying: after a number from a source, say in plain words what it means ("In other words, 33% of the plants with only one treatment stage are upgraded.").
5. Name things, not labels: the actual years or objects ("2018 and 2020", not "the sampling year"); never a bare "this part" or "these values".
6. Mark choices: own assumptions start with "We assumed"; each step is credited to whoever did it (the cited method or "we"). If unclear who did it, ask under "Points for the author to confirm".
7. Real numbers where they make a rule obvious; no made-up examples in the text. Examples needed only to explain go after the text, for the author.
8. Describe what happens in the data instead of a general rule for cases that never occur, but only when the user or the code confirms what happens. Otherwise keep the rule and flag it.
9. One-reading test: each sentence must be understood on first reading. If it needs an example to be understood, rewrite it again.

Examples:
- Before: "The share of positive samples was reduced by the same fraction as in the reference values." After: "Across all rivers, 20% of the samples were positive in 2018 and 8% in 2020. At each site, we reduced the positive samples of 2018 by the same relative amount."
- Before: "Unclassified samples were given the reference share of unclassified samples in the untreated samples." After: "We assumed that, at each site, the untreated samples are divided between the two groups in the same proportion as across all rivers. For 2018 we used the proportion of 2018, and for 2020 that of 2020."

Output: the rewritten text, then "Points for the author to confirm" (assumptions to check, attribution, numbers that need a source).

## 9. Figure and table captions

From 179 figure and 106 table captions in the corpus. Polish captions with the same minimal edits; flag missing information under "Points for the author to confirm", never invent it.

- **Title = noun phrase, no verb, no finding** (178 of 179 figure titles). "Spatial distribution of E. coli concentrations in river water.", not "E. coli concentrations increase downstream." Typical starts: Distribution of, Comparison of, Relative contribution of, Map of, Schematic of, Modelled ... . Median 16 words (figures), 11 (tables).
- **Figures:** after the title, short sentences that say how to read the figure, not what it means: what each panel shows, symbols, lines, colours, statistics, sample size. Plain verbs: show (most common), represent, indicate, denote. "The bars show ...", "The dashed line indicates the detection limit.", "Error bars represent the standard deviation (n = 3)."
- **Panels:** (a), (b) before or after the panel description, used the same way throughout the manuscript.
- **Define in the caption** every abbreviation, unit and symbol needed to read the figure on its own, e.g. "concentrations (log10 copies/100 mL)". Give the data source if not the authors' own ("Data from X et al. (2019).").
- **Tables:** title only, a noun phrase with units in brackets, often without a final full stop: "Removal of E. coli in each treatment step (log10 units)". Explanations, abbreviations and "nd, not detected" go in table footnotes (a, b, ...), not in the title.
- Keep the caption numbering and style the user already uses (Fig. 1. / Figure 1. / Fig. 1 |).
