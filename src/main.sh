#!/bin/bash
./check_args.sh "$@" || exit 1
source ./core.sh

triage=$(run_prompt ./prompts/assign.sh "$1")
if [ "$triage" = "Computer Algorithm" ]
then
  # allocate temp file
  dir=$(mktemp -d "/tmp/jeannie.XXXXX.XXXXX")
  scratch="$dir/scratch.sh"

  if [ -t 0 ]
  then
    run_prompt ./prompts/generate_script.sh "$1" > "$scratch"
  else
    run_prompt ./prompts/transform_script.sh "$1" > "$scratch"
  fi
  echo "Running script at $scratch..."
  chmod +x "$scratch"
  "$scratch"
else
  if [ -t 0 ]
  then
    run_streaming ./prompts/generate.sh "$1"
  else
    input_txt=$(cat)
    run_streaming ./prompts/transform.sh "$input_txt" "$1"
  fi
fi

