#!/bin/bash
if [[ -z "$OPENAI_API_KEY" ]]
then
  echo "genie: OPENAI_API_KEY is unset"
  exit 1
fi

if [ $# -eq 0 ]
then
    echo "genie: no arguments supplied"
    echo "usage: genie [command]"
    exit 1
fi
