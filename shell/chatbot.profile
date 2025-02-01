ai() {
  local keyword=$(pbpaste)

  urls=(
    "https://claude.ai/new?q=$keyword"
    "https://www.perplexity.ai/?q=$keyword"
  )

  for url in "${urls[@]}"
  do
    open -a 'Google Chrome' $url
  done
}

explf() {
  echo "Explain the Flutter code if you can.\n\`\`\`\n$(pbpaste)\n\`\`\`\n" | pbcopy
  ai
}

optmf() {
  echo "Optimize the Flutter code if you can.\n\`\`\`\n$(pbpaste)\n\`\`\`\n" | pbcopy
  ai
}

smplf() {
  echo "Simplify the Flutter code if you can.\n\`\`\`\n$(pbpaste)\n\`\`\`\n" | pbcopy
  ai
}

# deletes double quotes from the clipboard.
dq() {
  pbpaste | tr -d '"' | pbcopy
}
