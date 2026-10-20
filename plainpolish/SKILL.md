---
name: plainpolish
description: 'Polish English manuscript paragraphs in environmental science, water quality and pathogen modelling (QMRA, AMR, E. coli, wastewater, river models, etc.). Minimal edits, plain vocabulary checked against a corpus of published papers, no inflated claims, adequate hedging. Use when the user asks to polish, proofread or improve English academic text.'
---

# plainpolish: plain, restrained academic English polishing

The target style comes from 43 research papers published before 2022 in ES&T, Water Research, Nature journals (Nat Commun, Nat Clim Change), Environment International, STOTEN and Environmental Pollution. Writing at this level is enough. **Do not make the text more sophisticated than these papers.**

## 0. Default workflow

1. **Minimal edits.** Fix only grammar, cohesion, redundancy, ambiguity, tense and articles. Keep meaning, terminology and numbers unchanged.
2. **Do not upgrade words.** Keep a word if it is common in the corpus. Replace it if it is rare (see the vocabulary rule in section 1). A replacement must not be harder than the original.
3. **Output format.**
   - First give the full polished paragraph. Do not list the changes in a table and do not explain what was changed.
   - After the paragraph, add "Points for the author to confirm": questions about content, logic or evidence (an inference written as a fact, unclear terms or numbers, citation placement, etc.). List them only and do not change the text for them. If there are none, omit this part. Write these notes in the language the user writes in.
4. Restructure sentences only when the user asks for a major rewrite.

## 1. Vocabulary

Prefer plain verbs: show, find, estimate, calculate, simulate, use, apply, account for, compare, assume, indicate, suggest.

**Vocabulary rule.** Use words that are common in the corpus for all non-technical words.

- Do not introduce a word that is rare in the corpus.
- If a non-technical word in the user's text is rare in the corpus, replace it with a common word. Before replacing, look up the word in `corpus-wordlist.txt` (format "word count"; 43 papers, about 330,000 words). A word is listed only if it occurs at least 3 times and in at least 8 of the 43 papers; a word that is missing is rare. Use `grep -w "word" corpus-wordlist.txt` if you can run commands; otherwise read the file.
- A word is rare if it occurs fewer than 20 times or is missing. Replace it with a synonym that has a clearly higher count.
- **Never change technical terms**, even if they are missing from the list. This covers biological and microbiological terms (plasmid, conjugation, biofilm, invasion), abbreviations (ESBL, WWTP), model and parameter names (conjugation coefficients, decay rate, carrying capacity, routing), and names of statistics and methods. Test: would a specialist feel the meaning has changed if the phrase were altered? If unsure, treat it as a term and keep it. Replace only general words (verbs, adjectives, adverbs, connectives).
- Examples: `bound` and `constrain` used as verbs, `track`, `restricted` and `penetration` are missing from the list. Use account for (73), provide (103), limit (59), spread (83) instead. Rare words like these are the main source of an "AI voice".

### A. Banned words

| Do not use | Use instead |
|---|---|
| delve into | examine / study |
| tapestry, multifaceted, pivotal | delete, or state the specific content |
| leverage, harness, utilize | use |
| myriad, plethora | many |
| groundbreaking, unprecedented | first (only if true) or delete |
| holistic | overall / full, or delete |
| in stark contrast, contrasting sharply | in contrast / whereas |
| dramatic(ally), pronounced (describing change) | give the fold change or value |
| eradicate | eliminate / stop |
| emerge as | is / becomes |
| actionable insights, valuable insights | state what it can be used for |

### B. Restricted words

These occur in the corpus but rarely: robust, novel, comprehensive, crucial, critical, key, highlight, underscore, notably, importantly, substantial, paramount, shed light on, paves the way.

- Use each word at most once per manuscript, and only with a concrete meaning. Do not add one that is not in the original. `robust`, `highlight`, `underscore` and `notably` almost never appear in papers from before 2022 (they became much more common in papers from 2025), so **do not add them by default**.
- Use `comprehensive` only when the scope really is complete. Use `robust` only for statistical robustness or in its literal sense.
- Choose either `Moreover` or `Furthermore`, and do not use either in every paragraph.

### C. Technical terms and verbs

Keep terms as they are and do not replace them with synonyms. Common verbs and phrases are in `lexicon.md` (same folder, read when needed).

## 2. Strength of claims and hedging (most important)

- **Never inflate.** Do not change may/suggest/likely into demonstrate/clearly show.
- **Judge hedging by the evidence behind each sentence, not by frequency** (do not count hedge words).
  - Results the authors computed or measured directly: state plainly, no hedge (we show / Validation shows / The model simulates...).
  - Inferences, explanations of causes, extrapolation to other settings, predictions, recommendations: should carry a hedge (may, could, suggest, is likely, appear to).
  - If an inference is written as a fact, do not add a hedge yourself; list it under "Points for the author to confirm". If a direct result is over-hedged, the hedge can be removed.
  - Do not add may to every sentence to look cautious.
- Describe self-assessment and limitations in plain words, neither inflated nor belittling (reasonable / quite large / crude / does not perform well). Do not make the author's self-assessment sound better.
- Do not replace a number with an adjective ("80.2%" does not become "the vast majority"). If the text has only an adjective and the author may have the number, suggest adding it, but never invent one.
- State the range of validity: "should be used to look at the bigger picture", "computed risks should not be overinterpreted".

## 3. Writing limitations (the core of the Discussion)

Write each limitation in this order: **what it is, why, which direction it may bias the result, and what data or method would improve it.**
Example: "The model may be underestimating oocyst losses, particularly because dams, lakes and reservoirs are not yet included."
"It should be noted that..." is acceptable for introducing a caveat (common in Water Research and Environment International).

## 4. Sentences and connectives

- Use plain connectives: However, Therefore, Thus, Indeed, In addition, Nevertheless, In contrast, Here, To this end. Do not stack them or put one in every sentence.
- In Methods, give the purpose and the reason: "..., to exclude data from resistant isolates"; "For this reason, X was chosen as..."; "We therefore choose to...".
- Methods may use **we** for choices and assumptions ("We assume...", "We found 9 studies...").
- Tense: present for model structure ("The model calculates...", "is calculated as"); past for operations performed and results ("were compared", "remained low"); present for general facts.
- No dashes for parenthetical asides, no rhetorical questions, no triplets of parallel adjectives.
- Put figure and table references in brackets: (Fig. 2a–c), (Table S4).

## 5. Structure of each section

- **Abstract:** 1–2 sentences of background, then the gap or aim, then methods in order ("To this end, we first... Next, we..."), results with numbers, validation performance (state deviations honestly), and one sentence on significance.
- **Introduction:** the problem with numbers, then mechanisms or pathways, then existing models and their shortcomings, then the gap ("has not been fully described", "is limited by the lack of", "to date has not been combined with"), then "In this study we aim to..." or "Here, we show...", optionally followed by numbered aims.
- **Methods:** give the value, unit and source of each parameter; state key assumptions and simplifications explicitly ("... were set to zero", "Resuspension of oocysts from sediments is ignored"); say why a process was not included.
- **Results:** let numbers speak; explain with "This is primarily due to..." or "This could be attributed to...".
- **Discussion:** main findings and how they agree or disagree with earlier work, then the limitations one by one (section 3), then directions for improvement and applications; use should / we recommend for recommendations.

## 6. Calibration sentences (polished text should be at this level of difficulty)

- "These results suggest that reducing antibiotic use alone is likely insufficient for reversing resistance."
- "For this reason, conjugation was chosen as the focus of the current study."
- "Goodness of fit statistics are reasonable."
- "Modelling is a common approach to increase insight."
- "Oocyst excretion rates are variable and uncertain."
