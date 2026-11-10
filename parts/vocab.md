## Vocabulary

Plain verbs: show, find, estimate, calculate, simulate, use, apply, account for, compare, assume, indicate, suggest.

- Never introduce a word that is rare in the corpus; replace rare general words with clearly more common ones. Check `grep -w "word" corpus-wordlist.txt` ("word count"; only words with ≥3 uses in ≥8 papers). Rare = missing or <20. E.g. `bound`/`constrain` (verbs), `track`, `restricted`, `penetration` are missing; use account for (96), provide (113), limit (63), spread (93).
- **Never change technical terms**, even if missing: biological terms, abbreviations, model and parameter names (conjugation coefficients, decay rate), statistics, methods. If a specialist could feel the meaning changed, or if unsure, keep it.
- Keep the user's spelling (faecal/fecal, modelling/modeling). More phrases and domain terms: `lexicon.md`.

**Banned:** delve into → examine; tapestry, multifaceted, pivotal → delete or state the content; leverage, harness, utilize → use; myriad, plethora → many; groundbreaking, unprecedented → first (if true) or delete; holistic → overall or delete; in stark contrast → in contrast / whereas; dramatic(ally), pronounced (change) → give the value; eradicate → eliminate; emerge as → is / becomes; actionable / valuable insights → say what it can be used for.

**Restricted** (do not add; if kept, once per manuscript with a concrete meaning): robust (statistical only), novel, comprehensive (complete scope only), crucial, critical, key, highlight, underscore, notably, importantly, substantial, paramount, shed light on, paves the way. Moreover or Furthermore, not both, not in every paragraph.

