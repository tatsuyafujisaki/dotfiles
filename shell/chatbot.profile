ai() {
  local keyword=$(pbpaste)

  urls=(
    https://claude.ai/new?q=$keyword
    https://www.perplexity.ai/?q=$keyword
    https://gemini.google.com/app
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

tds() {
  echo "以下の文章は正しいか。「$(pbpaste)」" | pbcopy
  ai
}

# deletes double quotes from the clipboard.
dq() {
  pbpaste | tr -d '"' | pbcopy
  open -a 'Google Chrome' https://gemini.google.com/app
}
