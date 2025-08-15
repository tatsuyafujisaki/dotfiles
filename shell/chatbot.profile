alias dq='pbpaste | tr -d "\"" | pbcopy && open -a "Google Chrome" https://gemini.google.com/app' # deletes double quotes from the clipboard.

ai() {
  local query=$(pbpaste)

  urls=(
    https://chatgpt.com/?q=$query
    https://claude.ai/new?q=$query
    https://copilot.microsoft.com/?q=$query
    https://gemini.google.com/app
    https://grok.com/?q=$query
    https://www.perplexity.ai/?q=$query
  )

  for url in "${urls[@]}"
  do
    open -a 'Google Chrome' $url
  done
}

smpl() {
    echo "Simplify the code or script below.\n\`\`\`\n$(pbpaste)\n\`\`\`" | pbcopy
}

tds() {
  echo "以下の文章は正しいか。「$(pbpaste)」" | pbcopy
}
