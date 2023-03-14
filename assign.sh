#!/bin/bash
raw=$(
  echo "Determine whether the listed task should be assigned to Human Secretary or Computer Algorithm."
  echo ""
  echo "Task: Summarize this report."
  echo "Assign to: Human Secretary"
  echo ""
  echo "Task: Compute total profit and loss."
  echo "Assign to: Computer Algorithm"
  echo ""
  echo "Task: $1"
  echo "Assign to:"
)
prompt=$(echo "$raw" | jq -sR .)
curl https://api.openai.com/v1/completions \
  -H "Content-Type: application/json" \
  -H "Authorization: Bearer $OPENAI_API_KEY" \
  -d "{\"model\": \"text-davinci-003\", \"prompt\": $prompt, \"temperature\": 0, \"max_tokens\": 1000}" \
  -# | jq -r .choices[0].text
