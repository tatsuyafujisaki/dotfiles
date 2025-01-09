ai() {
  local keyword=$(pbpaste)

  urls=(
    "https://claude.ai/new?q=$keyword"
    "https://gemini.google.com"
    "https://www.perplexity.ai/?q=$keyword"
  )

  for url in "${urls[@]}"
  do
    open -a 'Google Chrome' $url
  done
}

th() {
  echo "$(pbpaste)とは？" | pbcopy
  ai
}
