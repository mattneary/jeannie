# jeannie

![I Dream of Jeannie](jeannie.png)

## Installation

```bash
$ npm install -g jeannie
```

## Use in a pipe

```bash
$ ls -la | genie "return the name of the largest file"
######################################################################## 100.0%
README.md
```

## Use for script writing

```bash
$ genie "do fizzbuzz"
######################################################################## 100.0%

#!/bin/bash

for i in {1..100}
do
    if [ $(($i % 15)) -eq 0 ]; then
        echo "FizzBuzz"
    elif [ $(($i % 3)) -eq 0 ]; then
        echo "Fizz"
    elif [ $(($i % 5)) -eq 0 ]; then
        echo "Buzz"
    else
        echo $i
    fi
done
```
