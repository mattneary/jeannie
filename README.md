# jeannie 🧞‍♀️

There's an [old story](http://www.leancrew.com/all-this/2011/12/more-shell-less-egg/) among
programmers about Donald Knuth and Doug McIlroy. It centers on the following
text-processing problem:

> Read a file of text, determine the *n* most frequently used words, and print
> out a sorted list of those words along with their frequencies.

In the end, both men come up with a solution. But while Knuth's program is long
and formal, McIlroy's is a six-command shell pipeline.

Now, with `jeannie`, I present the one-command shell pipeline that solves the
same problem. Just describe the problem and your personal genie will take it
from there.

```bash
$ cat if.txt | genie "determine the 5 most frequently used words, and print out a sorted list of those words along with their frequencies"
######################################################################## 100.0%
1. you (9 times)
2. can (8 times)
3. and (7 times)
4. If (7 times)
5. your (6 times)
```

⚠️  Unfortunately, the solution might be a total hallucination. The above are
not, in fact, the correct frequencies from Rudyard Kipling's "If—."

## Practical Tips

This tool has the same strengths, and weaknesses, as GPT-3 generally. The above
task involves precision and counting, so should realistically not be done using
`genie`.

Instead, think about things like these:

```bash
$ cat post.md | genie "summarize this essay"
$ ls | genie "label each file with what it does"
```

Alternatively, if you want help with a structured task you can instead use
`genie` to generate a bash script, which in turn will give you more exact
answers:

```bash
$ genie "read stdin, determine the 5 most frequently used words, and print out a sorted list of those words along with their frequencies"
######################################################################## 100.0%

#!/bin/bash

# Read stdin
words=$(cat)

# Count the frequency of each word
freq=$(echo $words | tr ' ' '\n' | sort | uniq -c | sort -nr)

# Get the 5 most frequently used words
top_five=$(echo "$freq" | head -n 5)

# Print out the sorted list of words and their frequencies
echo "$top_five"
```

## Installation

Try it for yourself—it's surprising what it can do.

```bash
$ npm install -g jeannie
```

Since this is all powered by GPT-3 behind the scenes, you'll
need to put your API key in your env to get it running.

```bash
$ export OPENAI_API_KEY=XYZ
$ ls -la | genie "list the largest file"
```
