# plainpolish

A Claude skill for polishing English academic text in environmental science, water quality and pathogen modelling (QMRA, AMR, *E. coli*, wastewater, river models).

## What it can do

Give it a paragraph from an abstract, introduction, methods, results or discussion, and it will:

1. **Fix the language with minimal edits**: grammar, cohesion, redundancy, tense and articles.
2. **Replace unusual words** with words that published papers in the field actually use, and leave technical terms untouched.
3. **Remove AI-sounding wording**, such as *delve*, *leverage*, *holistic* and *pivotal*.
4. **Keep claims at the strength of the evidence**: no "demonstrates" where the paper only suggests.
5. **Flag problems it will not fix by itself**, for example an inference written as a fact, an unclear term, or a citation in the wrong place, as a short list for you to confirm.

Example (invented text):

> **Before:** We leveraged a robust model to delve into the multifaceted dynamics of *E. coli* decay, which underscores the pivotal role of temperature.
>
> **After:** We used a model to examine the decay of *E. coli*, which shows that temperature is important.

## Why it exists

Most AI polishing makes text sound more "sophisticated": *delve*, *leverage*, *holistic*, *robust*, *underscore*, and claims that are stronger than the evidence. This skill does the opposite. It aims for the plain, restrained style of published papers. Its main rules are:

- **Minimal edits.** Grammar, cohesion, redundancy, tense and articles only. Meaning, terminology and numbers stay as they are.
- **Corpus-checked vocabulary.** General words that are rare in a corpus of 43 papers published before 2022 are replaced by common ones. Technical terms are never changed.
- **No inflated claims.** Hedging follows the strength of the evidence in each sentence. Inferences are not upgraded to facts.
- **Banned and restricted words.** A short list of words typical of AI-written text is banned. Words such as *robust* or *underscore* are not added by default.
- **Short review notes.** After the polished paragraph, the skill lists questions about content, logic or evidence for the author to confirm. It does not change the text for them.

## Install

Copy the `plainpolish/` folder into your skills directory, for example `~/.claude/skills/`, and start a new session. Then ask Claude to polish a paragraph, or run `/plainpolish`.

## Files

| File | Purpose |
|---|---|
| `plainpolish/SKILL.md` | The rules. Loaded on every use (about 2,200 tokens). |
| `plainpolish/lexicon.md` | Domain terms and common verbs and phrases. Read only when needed. |
| `plainpolish/corpus-wordlist.txt` | Word frequencies ("word count") for the vocabulary check. Looked up with `grep`, never read in full. |

---

## How this skill was created

Nothing was trained. No model weights changed. A skill is a text file that Claude reads when you call it. This one was made by **measuring a set of papers that the author considered well written, turning the measurements into written rules, and then correcting the rules with feedback on real paragraphs.**

### 1. Collect reference papers
Start from papers whose style you accept as "good enough". Here these were research papers from ES&T, Water Research, Nature journals, Environment International, STOTEN and Environmental Pollution.

Two filters mattered:
- **Publication year.** Only papers from 2021 or earlier were used. Papers from 2025 contained noticeably more words typical of AI polishing (for example *underscore*, *robust*, *notably*), so they would have taught the wrong style.
- **Original text only.** Summaries and notes of papers (including AI-written ones) are not a source of style. Use the paper itself.

### 2. Extract the text
```bash
pdftotext -enc UTF-8 paper.pdf - | awk '/^(References|REFERENCES)[ ]*$/{exit} {print}' > paper.txt
```
This keeps the body and drops the reference list. Ligatures such as "fi" and "ff" are sometimes lost in the extraction, which leaves fragments like "signi" and "uent" in the word list. Remove them.

### 3. Measure
Count how often words and phrases occur, per journal and over all papers:
- Words that sound "AI-like" and how often published papers actually use them.
- Connectives (however, therefore, thus).
- Hedging words (may, could, suggest, likely).
- Verbs used to report results and describe methods.

A one-line example of a count:
```bash
grep -oF "robust" corpus.txt | wc -l
```

### 4. Build a word list
Count every word and keep a word only if it occurs in several papers, not just many times in one:
```bash
# per-paper counts, then keep words with total count >= 3 that appear in >= 8 papers
awk 'FNR==1{delete s} {n=split(tolower($0),a,/[^a-z]+/); for(i=1;i<=n;i++){w=a[i]; if(length(w)<3)continue; t[w]++; if(!((w) in s)){s[w]=1; d[w]++}}} END{for(w in t) if(t[w]>=3 && d[w]>=8) print w, t[w]}' texts/*.txt | sort -k2,2nr > corpus-wordlist.txt
```
The same step removes author names, affiliations and publisher boilerplate, which appear in only a few papers. This list is what lets the skill say "this word is rare in the field, use a common one instead". Only counts are published here, not paper text.

### 5. Write the rules by hand
The statistics do not write the skill. They show what is true about the papers. A person then decides which parts become rules. The resulting rules fall into these groups:
- **Workflow.** Minimal edits, what to output, what not to output.
- **Vocabulary.** A banned list, a restricted list, and the corpus-checked rule for everything else.
- **Claims and hedging.** Never inflate. Hedge inferences, not directly measured results.
- **Sentence habits.** Connectives, tense, no dashes for asides, no rhetorical questions.
- **Section structure.** Typical order of an abstract, introduction, methods, results and discussion.
- **Calibration sentences.** A few real sentences showing the intended difficulty level.

### 6. Correct it with feedback
The first version was wrong in several ways. Real paragraphs and short corrections fixed it:

| Problem found | Rule added or changed |
|---|---|
| The skill used verbs that almost never appear in the field (for example *bound* or *constrain* as verbs). | Look every replacement word up in the word list. Rare words are not allowed. |
| It replaced a technical term (*conjugation coefficients*) with a more common word. | Technical terms are never changed, even if they are missing from the list. |
| A target of "3.5 to 5 hedge words per 1,000 words" was useless in practice. | Hedge by the evidence in each sentence, not by frequency. |
| It split long sentences and removed connectives the author had chosen. | Minimal edits: no restructuring unless asked. |
| It listed every change in a table. | Output the paragraph, then only the questions for the author. |
| It was tempting to drop the banned list because the model "would not use those words anyway". | Keep it. Those are the words a model writes by default. |

### 7. Keep the cost low
A skill is loaded every time it is called, so size matters:
- `SKILL.md` is the only file loaded each time (about 2,200 tokens).
- The lexicon is read only when needed.
- The word list is searched with `grep`, so it costs no tokens.
- Rules are written in English. The same content in Chinese costs more tokens.

---

## How to make a similar skill for your own field

1. **Pick the job and the reader.** "Polish a paragraph so that it reads like a paper in my field" is a clear job. "Write better" is not.
2. **Gather 20 to 50 papers you trust** in your field, published before AI polishing was common. Fewer than about 20 gives noisy numbers. More than about 50 adds little.
3. **Extract their text** (step 2 above) and keep it on your own machine. Do not publish it, because it is under copyright.
4. **Measure** the things you care about (step 3). Ask a specific question for each number, for example "do published papers really use this word?"
5. **Make a word list** (step 4) so the skill can check vocabulary against your field instead of its own habits.
6. **Write `SKILL.md`** with a name and a one-sentence description at the top:
   ```markdown
   ---
   name: your-skill-name
   description: 'What the skill does and when to use it.'
   ---
   ```
   Then write the rules as short, concrete instructions. Prefer "do X, not Y" with examples over general advice.
7. **Test on real paragraphs.** Run it on text you wrote yourself. Every time the output is wrong, add a rule that would have prevented it, and write down why.
8. **Review for private information before you publish.** Search every file for your name, email, institution, file paths and the titles of your own unpublished work. Check the word list as well, since names and affiliations get into it.
9. **Keep it small.** Delete anything the model does not need: history logs, statistics tables, explanations of why. A rule that is never applied still costs tokens every time.

### Things that went wrong, so you can avoid them
- Treating a measured frequency as a rule. A statistic tells you what papers do. Whether a sentence needs a hedge depends on the sentence.
- Allowing the skill to replace words it does not understand. In a technical field, an unfamiliar word is usually a term.
- Including papers from the AI era in the reference set.
- Letting the skill explain every change. It makes the answer long and the reader stops reading it.

## Limits

- The corpus is small (43 papers), so the word list is a guide, not a standard.
- The rules were tuned for environmental science and may suit other fields less well.
- The skill does not check facts, citations or numbers. Always read the polished text yourself.

## License

MIT, see `LICENSE`.
