#!/bin/bash
function stream_curl() {
  curl https://api.openai.com/v1/completions \
      -H "Content-Type: application/json" \
      -H "Accept: text/event-stream" \
      -H "Authorization: Bearer $OPENAI_API_KEY" \
      -d "{\"model\": \"text-davinci-003\", \"prompt\": $1, \"temperature\": 0, \"max_tokens\": 1000, \"stream\": true}" \
      -s
}

function get_streaming() {
  prompt=$(echo "$1" | jq -sR .)
  stream_curl "$prompt" | cut -d':' -f2- | while read -r msg; do
    if [ "$msg" != "[DONE]" ]; then
     jq -rj ".choices[0].text" <<< "$msg"
    fi
  done
  echo ""
}

function get_completion() {
  prompt=$(echo "$1" | jq -sR .)
  curl https://api.openai.com/v1/completions \
    -H "Content-Type: application/json" \
    -H "Authorization: Bearer $OPENAI_API_KEY" \
    -d "{\"model\": \"text-davinci-003\", \"prompt\": $prompt, \"temperature\": 0, \"max_tokens\": 1000}" \
    -# | jq -r .choices[0].text
}

function run_streaming() {
  file="$1"
  shift
  prompt=$("$file" "$@")
  get_streaming "$prompt"
}

function run_prompt() {
  file="$1"
  shift
  prompt=$("$file" "$@")
  get_completion "$prompt"
}
