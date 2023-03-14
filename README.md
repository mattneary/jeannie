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
######################################################################## 100.0%
  16 and
  14 you
  13 if
  12 can
  10 your
```

But `jeannie` is good at all kinds of things, including many that you couldn't
normally do from the command-line. Here's another example:

```bash
cat if.txt | ./genie "Write a summary of this poem and select a couple of the best quotes"
######################################################################## 100.0%
######################################################################## 100.0%
This poem is about having the strength and courage to stay true to yourself and
your values, even when faced with difficult situations. It encourages the
reader to remain resilient and to not be swayed by the opinions of others. Two
of the best quotes from the poem are: "If you can wait and not be tired by
waiting, / Or being lied about, don’t deal in lies," and "If you can fill the
unforgiving minute / With sixty seconds’ worth of distance run, / Yours is the
Earth and everything that’s in it, / And—which is more—you’ll be a Man, my
son!"
```

## How It Works

Under the hood, `jeannie` is two tools in one. First, GPT-3 is used to sort the
given command into one of two buckets: tasks involving soft skills are
completed by a follow-on GPT-3 completion, whereas tasks that demand greater
precision are delegated to bash--with GPT-3 being used to generate the bash
code. The triage prompt is broke into a function called `assign`.

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
