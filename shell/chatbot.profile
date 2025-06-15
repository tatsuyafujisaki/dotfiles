alias dq='pbpaste | tr -d "\"" | pbcopy' # deletes double quotes from the clipboard.

ai() {
  local query=$(pbpaste)

  urls=(
    http://grok.com/?q=$query
    https://chatgpt.com/?q=$query
    https://claude.ai/new?q=$query
    https://copilot.microsoft.com/?q=$query
    https://gemini.google.com/app
    https://github.com/copilot
    https://www.perplexity.ai/?q=$query
  )

  for url in "${urls[@]}"
  do
    open -a 'Google Chrome' $url
  done
}

tds() {
  echo "以下の文章は正しいか。「$(pbpaste)」" | pbcopy
  ai
}
