# jeannie 🧞‍♀️

There's an [old story](http://www.leancrew.com/all-this/2011/12/more-shell-less-egg/) among
programmers about Donald Knuth and Doug McIlroy. It centers on the following
text-processing problem:

> Read a file of text, determine the *n* most frequently used words, and print
> out a sorted list of those words along with their frequencies.

In the end, both men come up with a solution. But while Knuth's program is long
and formal, McIlroy's is a six-command shell pipeline.

Now, with `jeannie`, I present the one-command shell pipeline that solves the
same problem. Now, *the problem statement is the solution*.

```bash
$ cat if.txt | genie "determine the 5 most frequently used words, and print out a sorted list of those words along with their frequencies"
  16 and
  14 you
  13 if
  12 can
  10 your
```

But `jeannie` is good at all kinds of things, including many that you couldn't
normally do from the command-line. Here's another example:

```bash
$ cat README.md | genie "summarize how to run the backend"
To run the backend, ensure that the Postgres docker container is running, then
run the following commands from the backend directory: `pip install -r
requirements.txt` and `uvicorn app.main:app --reload`.
```

## How It Works

Under the hood, `jeannie` is two tools in one. First, GPT-3 is used to sort the
given command into one of two buckets: tasks involving soft skills are
completed by GPT-3 with the result being streamed right to your terminal,
whereas tasks that demand greater precision are delegated to bash--with GPT-3
being used to generate the bash code. The triage prompt is in a prompt file
called `assign.sh`.

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
