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

## Installation

Try it for yourself—it's surprising what it can do.

```bash
$ npm install -g jeannie
```

As you might've guessed, this is all powered by GPT-3 behind the scenes. To get
it running, you'll need to put your API key in your env.

```bash
$ export OPENAI_API_KEY=XYZ
$ ls -la | genie "list the largest file"
```
