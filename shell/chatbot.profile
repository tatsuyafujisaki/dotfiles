ai() {
  local keyword=$(pbpaste)

  urls=(
    http://grok.com/?q=$keyword
    https://chatgpt.com/?q=$keyword
    https://claude.ai/new?q=$keyword
    https://copilot.microsoft.com/?q=$keyword
    https://gemini.google.com/app
    https://www.perplexity.ai/?q=$keyword
  )

  for url in "${urls[@]}"
  do
    open -a 'Google Chrome' $url
  done
}

smpl() {
  echo "Simplify the code.\n\`\`\`\n$(pbpaste)\n\`\`\`\n" | pbcopy
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
